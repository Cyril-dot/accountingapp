# Feature spec (v1 proposal)

This spec describes what the rebuild will do. **Sourcing:** every feature here is
written from the *public* Google Play description of the original app and from general
accounting / point-of-sale knowledge, plus the additions in the rebuild plan. Nothing
has been taken from decompiling the original APK — the APK was checked only for identity
(see `../LICENCES.md`). No original code, text, images, icons or branding is reused.

Priorities: **M** = must-have in version one · **S** = soon after · **L** = later.

---

## 1. Onboarding and settings

- **M** First-run setup: business name, phone, address, TIN, logo.
- **M** Default Ghana tax rates seeded (VAT 15%, NHIL 2.5%, GETFund 2.5%, COVID 1%,
  zero-rated, exempt), all editable — rates are data, not code.
- **M** Choose default currency (GHS) and the accounts the app creates automatically.
- **M** Single-shop works out of the box; multi-shop (more than one shop, each with its
  own books) is supported from the start — the data model is scoped by `shop_id`.
- **M** Multi-user with PIN: owner, accountant, cashier (see §9).

## 2. Dashboard

- **M** One screen for the current month: total sales, purchases, payments received,
  payments made, expenses, profit, and cash + bank + MoMo balances.
- **M** Tap any figure to drill into its ledger/report.
- **S** Month picker and period comparison; a simple chart of daily sales.

## 3. Sales (with and without invoice)

- **M** Record a sale: pick customer (or walk-in), add items, quantity, price, discount,
  tax; totals update live.
- **M** Sell with or without an invoice.
- **M** Immediate stock drop on sale, and cost of goods sold feeding profit.
- **M** Sales history with search and edit/void (edit locked by role/age).

## 4. Purchases

- **M** Record a purchase from a supplier, with or without an invoice.
- **M** Immediate stock rise on purchase; input tax captured for VAT credit.
- **M** Purchases on credit become a payable; purchases paid now move cash/MoMo.

## 5. Payments, receivables and payables

- **M** Record money in (customer pays) and money out (we pay supplier).
- **M** Payment methods: Cash, MTN MoMo, Telecel Cash, AirtelTigo Cash, Bank transfer.
- **M** One payment can settle several invoices; one invoice can be paid in parts.
- **M** Receivables and payables reports: who owes us, who we owe, with reminders.
- **S** MoMo transaction reference capture; statement reconciliation where an API allows.

## 6. Expenses

- **M** Record an expense in cash or on credit, with an optional supplier and input tax.
- **M** Expense categories (rent, utilities, transport, salaries…).
- **S** Receipt photo attachment.

## 7. Inventory

- **M** Product list with SKU/barcode, name, category, unit, cost, price, stock.
- **M** Stock movements ledger (sale, purchase, return, adjustment) as source of truth.
- **M** Low-stock alerts at a reorder level.
- **S** Expiry tracking for food/drug items.

## 8. Invoicing and quotes

- **M** Turn a sale/purchase into a neat invoice with business name, logo, phone, TIN.
- **M** Export invoice to PDF and share via WhatsApp.
- **M** Quotes (no stock or posting) that convert to an invoice.
- **S** Payment link / MoMo number printed on the invoice; payment reminders.

## 9. Multi-user roles and permissions

- **M** Owner, accountant, cashier — each with their own PIN.
- **M** Cashier can sell and print receipts, cannot see profit or edit old records.
- **M** Accountant records/edits and runs tax and ledger reports.
- **M** Owner does everything and manages users.

## 10. Point of sale (the till)

- **S** POS screen: search or **scan a barcode**, add to cart, change quantity, discount.
- **S** Take cash or MoMo, show change due.
- **S** Print a receipt on a Bluetooth ESC/POS thermal printer.
- **S** Fallback: share the receipt as PDF on WhatsApp when no printer is present.

## 11. Accounting core

- **M** Full ledger for any account with running balance.
- **M** Double-entry journals; complex transactions as manual journal entries.
- **M** Trial balance, profit & loss.
- **M** VAT/levy tracking: input credits on purchases offset against output tax on sales.
- **M** Monthly VAT/levy summary a shop owner can hand to an accountant or the GRA.

## 12. Backup, export and offline

- **M** Fully offline; internet never required to sell or record.
- **M** Backup to file and restore; export to PDF and Excel.
- **S** Automatic backup to Google Drive with restore.
- **L** Multi-device sync through a small backend (app must never depend on it to sell).

---

## Version-one scope (the cut)

Ship v1 with the **M** items: onboarding + settings, dashboard, sales, purchases,
payments/receivables/payables, expenses, inventory (core), invoicing with PDF + WhatsApp,
multi-user with PIN, the accounting core (ledger, journals, trial balance, VAT summary),
and offline + file backup + PDF/Excel export.

POS barcode scanning and Bluetooth printing, Google Drive backup, MoMo statement sync,
and multi-device sync land in the next releases. This keeps the first release simple and
complete, which also lowers Apple review risk.

> These priorities are a **proposal**. The final feature list is the user's call — the
> Phase 0 question "which features do you want in version one" is still open.
