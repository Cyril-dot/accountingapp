# Data model

This is the accounting data model for the rebuild. It is written before any screen is
built, because every later feature sits on it. It is stack-independent: the same
entities, fields and rules apply whether the app is built in Flutter, Kotlin/Compose or
anything else.

## Two non-negotiable rules

1. **All money is an integer in the smallest unit.** In Ghana this is the *pesewa*
   (1 cedi = 100 pesewas). Amounts, prices, tax and totals are stored as signed 64-bit
   integers of pesewas. Floating point never touches money. A price of GH₵ 12.50 is the
   integer `1250`. Totals therefore never drift by a pesewa.
2. **Every transaction posts balanced double-entry lines.** Debits always equal credits.
   The "Journal entry" section below fixes, once and for all, how each business event
   maps to debit/credit lines, so the ledger, trial balance and profit-and-loss are
   always consistent.

## Conventions

- `id` — UUID (or autoincrement) primary key on every table.
- `*_id` — foreign key.
- `created_at` / `updated_at` — timestamps on every row.
- `deleted` (soft delete flag) on master data, so historical documents stay intact.
- `amount`, `price`, `cost`, `tax_*` — integer pesewas.
- `rate_bp` — a rate in *basis points* (1% = 100 bp). 15% VAT = `1500`. Integer, no float.
- `qty` — quantity in thousandths where needed (e.g. 1.250 kg = `1250`), integer.

---

## 1. Master data

### business (settings)
| Field | Type | Notes |
|---|---|---|
| id | uuid | single row (single-shop) or one per shop (multi-shop) |
| name | text | business name on invoices |
| logo_path | text | nullable |
| phone | text | |
| email | text | |
| address | text | |
| tin | text | GRA Taxpayer Identification Number |
| currency | text | default `GHS` |
| default_tax_rate_id | uuid → tax_rate | default rate applied to new lines |

### shop (only if multi-shop is chosen)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| business_id | uuid → business | |
| name | text | |
| address / phone | text | |
| is_active | bool | |

### user (and role)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | scope of this user |
| full_name | text | |
| pin_hash | text | salted hash only, never plaintext |
| role | enum | `owner` · `cashier` · `accountant` |
| is_active | bool | |

Role permissions (enforced in the app, not in the DB):
- **owner** — everything, including profit, old-record edits, user management.
- **accountant** — record/edit, ledgers, tax reports, expenses; cannot sell at the till.
- **cashier** — POS sales and receipts only; cannot see profit or edit locked/old records.

### account (chart of accounts)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| code | text | e.g. `1000`, `4000` |
| name | text | e.g. "Cash in hand", "MTN MoMo" |
| type | enum | `asset` · `liability` · `equity` · `income` · `expense` |
| subtype | text | e.g. `cash`, `bank`, `momo`, `inventory`, `receivable`, `payable`, `tax_payable`, `tax_input`, `sales`, `cogs` |
| is_system | bool | true for accounts the app creates automatically |
| is_active | bool | |
| opening_balance | int | pesewas, signed (debit positive) |

Seed accounts the app creates on first run:
- Assets: `Cash in hand`, `Bank`, `MTN MoMo`, `Telecel Cash`, `AirtelTigo Cash`, `Inventory`, `Accounts receivable`, `VAT input (recoverable)`.
- Liabilities: `Accounts payable`, `VAT output payable`, `NHIL/GETFund/levies payable`.
- Equity: `Owner capital`, `Owner drawings`.
- Income: `Sales`, `Other income`.
- Expense: `Cost of goods sold`, `General expenses`, `Purchases`.

### tax_rate
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| name | text | e.g. "VAT 15%", "NHIL 2.5%", "Zero-rated", "Exempt" |
| rate_bp | int | 1500 for 15% |
| kind | enum | `output` (charged on sales) · `input` (claimed on purchases) |
| is_levy | bool | true for NHIL/GETFund/COVID (reported separately) |
| is_active | bool | |

Ghana defaults (confirm current GRA rates before shipping): VAT 15% (`1500`), NHIL 2.5%
(`250`), GETFund 2.5% (`250`), COVID-19 levy 1% (`100`), plus `Zero-rated` and `Exempt`.
Rates are data, not code, so they can change without an app release.

### party (customer or supplier)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| kind | enum | `customer` · `supplier` · `both` |
| name | text | |
| phone | text | |
| email | text | |
| address | text | |
| tin | text | for B2B VAT invoices |
| credit_limit | int | pesewas, nullable |
| credit_days | int | payment terms in days |
| opening_balance | int | signed pesewas |

One `party` table with a `kind` flag covers customers and suppliers together, which is
exactly what "payables and receivables" needs: the same person can owe us (customer)
and be owed by us (supplier) without duplicating them.

### category (product category)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| name | text | |
| parent_id | uuid → category | nullable, for nesting |

### product (inventory item)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| sku | text | unique |
| barcode | text | for scanner lookup |
| name | text | |
| description | text | |
| category_id | uuid → category | |
| unit | text | e.g. `each`, `kg`, `box` |
| cost | int | latest purchase cost (pesewas), used for COGS |
| price | int | sale price (pesewas) |
| tax_rate_id | uuid → tax_rate | |
| stock_on_hand | int | cached running total; the truth is `stock_movement` |
| reorder_level | int | low-stock threshold |
| expires_at | date | nullable, for food/drug expiry tracking |
| is_active | bool | |

`stock_on_hand` is a cache for fast listing; the source of truth is the sum of
`stock_movement.delta_qty`. Any drift between them is a bug, not a feature.

### payment_method
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| name | text | `Cash`, `MTN MoMo`, `Telecel Cash`, `AirtelTigo Cash`, `Bank transfer`, `Card` |
| account_id | uuid → account | the asset account this method moves money into/out of |

---

## 2. Transaction documents

### invoice (sale, purchase, or quote)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| number | text | human-friendly, per shop, per type, sequential |
| kind | enum | `sale` · `purchase` · `quote` |
| party_id | uuid → party | |
| date | date | |
| due_date | date | nullable |
| status | enum | `draft` · `quoted` · `issued` · `partially_paid` · `paid` · `void` |
| subtotal | int | pesewas |
| discount_total | int | pesewas |
| tax_total | int | pesewas (all output/input tax on the document) |
| total | int | pesewas = subtotal − discount + tax |
| paid_total | int | pesewas settled so far |
| reference | text | nullable (their PO / our quote ref) |
| notes | text | |

### invoice_line
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| invoice_id | uuid → invoice | |
| product_id | uuid → product | nullable if ad-hoc line |
| description | text | snapshot of the item name |
| qty | int | thousandths |
| unit_price | int | pesewas |
| discount | int | pesewas on this line |
| tax_rate_id | uuid → tax_rate | snapshot of the rate applied |
| tax_amount | int | pesewas |
| line_total | int | pesewas |

Line snapshots (`description`, `unit_price`, `tax_rate_id`, `tax_amount`) keep old
invoices correct even after a product's name or price changes.

### payment
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| number | text | |
| direction | enum | `received` (customer → us) · `made` (us → supplier) |
| party_id | uuid → party | |
| date | date | |
| method_id | uuid → payment_method | |
| amount | int | pesewas |
| reference | text | MoMo transaction ref, cheque number, etc. |
| notes | text | |

### payment_allocation (splits a payment across invoices)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| payment_id | uuid → payment | |
| invoice_id | uuid → invoice | |
| amount | int | pesewas applied to this invoice |

This lets one payment clear several invoices, and one invoice be paid in parts.

### expense
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| date | date | |
| account_id | uuid → account | expense account |
| supplier_id | uuid → party | nullable (when bought on credit) |
| amount | int | pesewas |
| tax_input | int | pesewas of recoverable input tax, if any |
| method_id | uuid → payment_method | nullable (when paid cash now) |
| notes | text | |

### stock_movement (source of truth for inventory)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| product_id | uuid → product | |
| date | datetime | |
| type | enum | `sale` · `purchase` · `sale_return` · `purchase_return` · `adjustment` |
| delta_qty | int | signed, thousandths (sale = negative) |
| unit_cost | int | pesewas (for COGS and valuation) |
| ref_type | text | `invoice` · `expense` · `manual` |
| ref_id | uuid | link to the source document |
| note | text | |

A sale lowers stock (`delta_qty < 0`), a purchase raises it. Cost of goods sold is the
sum of `unit_cost × |delta_qty|` on sale-type movements.

### journal_entry (double-entry journal)
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| shop_id | uuid → shop | |
| number | text | |
| date | date | |
| memo | text | |
| ref_type | text | `sale` · `purchase` · `payment` · `expense` · `opening` · `manual` |
| ref_id | uuid | link to the source document |
| status | enum | `draft` · `posted` |

### journal_line
| Field | Type | Notes |
|---|---|---|
| id | uuid | |
| entry_id | uuid → journal_entry | |
| account_id | uuid → account | |
| debit | int | pesewas, ≥ 0 |
| credit | int | pesewas, ≥ 0 |

Invariant: for every `journal_entry`, `SUM(debit) = SUM(credit)`.

---

## 3. Journalization — the rules that keep the books balanced

Every posted document creates one `journal_entry`. These are the fixed mappings.

### Sale — cash (customer pays now)
| Account | Debit | Credit |
|---|---|---|
| Cash / MoMo / Bank (method account) | total | |
| Sales (income) | | subtotal − discount |
| VAT output payable (liability) | | tax_total |
| Cost of goods sold (expense) | cost | |
| Inventory (asset) | | cost |

### Sale — credit (customer owes us)
| Account | Debit | Credit |
|---|---|---|
| Accounts receivable (asset) | total | |
| Sales (income) | | subtotal − discount |
| VAT output payable (liability) | | tax_total |
| Cost of goods sold (expense) | cost | |
| Inventory (asset) | | cost |

### Purchase — cash (we pay now)
| Account | Debit | Credit |
|---|---|---|
| Inventory (asset) | subtotal − discount | |
| VAT input recoverable (asset) | tax_total | |
| Cash / MoMo / Bank | | total |

### Purchase — credit (we owe the supplier)
| Account | Debit | Credit |
|---|---|---|
| Inventory (asset) | subtotal − discount | |
| VAT input recoverable (asset) | tax_total | |
| Accounts payable (liability) | | total |

### Payment received (customer settles a credit sale)
| Account | Debit | Credit |
|---|---|---|
| Cash / MoMo / Bank | amount | |
| Accounts receivable | | amount |

### Payment made (we settle a supplier)
| Account | Debit | Credit |
|---|---|---|
| Accounts payable | amount | |
| Cash / MoMo / Bank | | amount |

### Expense (cash)
| Account | Debit | Credit |
|---|---|---|
| Expense account | amount − tax_input | |
| VAT input recoverable (asset) | tax_input | |
| Cash / MoMo / Bank | | amount |

### Expense (on credit to a supplier)
| Account | Debit | Credit |
|---|---|---|
| Expense account | amount − tax_input | |
| VAT input recoverable (asset) | tax_input | |
| Accounts payable | | amount |

### Sale return / Purchase return
Reverse the corresponding sale/purchase lines (with the same sign rules), and post the
reverse stock movement. This keeps refunds and returns consistent rather than inventing
negative sales.

---

## 4. Reports (computed from the tables above)

- **Dashboard (month):** total sales, purchases, payments received/made, expenses,
  gross profit, and cash + bank + MoMo balances — summed from journal lines and
  payments for the selected month.
- **Ledger:** for one account, every `journal_line` ordered by date, with a running
  debit/credit/balance.
- **Trial balance:** per account, `SUM(debit) − SUM(credit)`, all accounts must net to 0.
- **Profit & loss:** income accounts − expense accounts over a period.
- **Payables / receivables:** open invoices minus allocated payments, per party.
- **VAT/levy summary:** output tax on sales − input tax on purchases, per rate, per month.
- **Stock report:** current stock, valuation, low-stock and expiry alerts.
