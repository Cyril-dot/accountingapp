# Architecture & build order

Targets: Flutter (Android + iOS), offline-first, MIT open source. Money is always an
integer (pesewas); every business event posts balanced double-entry lines. The source
of truth for entities and rules is `../docs/data-model.md`.

## Package stack (recommended; verify licence when added, then record in LICENCES.md)

| Concern | Package | Notes |
|---|---|---|
| State / DI | `flutter_riverpod` | Testable, no codegen for basics. |
| Local DB | `drift` + `drift_flutter` + `sqlite3_flutter_libs` | Type-safe SQL for the full schema, relations, migrations. Best fit for double-entry queries. |
| Money type | none (own `Money` value type on `int`) | Smallest unit only; formatting via `intl`. |
| i18n / format | `intl` | Currency (GH₵), dates, numbers. |
| Barcode scan | `mobile_scanner` (ML Kit) or `zxing2` | Decide at POS phase; both free. |
| PDF | `pdf` | Invoices, receipts, reports. |
| Thermal print | `esc_pos_utils` (+ Bluetooth transport) | ESC/POS over Bluetooth; verify printer model. |
| Excel export | `excel` | Simple .xlsx export (MIT). |
| Share / WhatsApp | `share_plus` | Send PDFs. |
| Secure storage | `flutter_secure_storage` | PIN hashes, backup tokens, MoMo creds. |
| File paths | `path_provider` | Backup/export location. |

Later (not v1): Google Drive backup, MoMo provider SDKs, multi-device sync backend.

## Folder layout

```
app/lib/
  main.dart                 # bootstrap, providers, routing
  core/                     # money (int pesewas), result, ids, dates, errors
    money.dart              # Money value type + GH₵ formatting (pure, heavily tested)
  data/
    db/                     # drift database + tables + migrations
    repositories/           # concrete impls of domain ports
  domain/
    models/                 # entities (Account, Party, Product, Invoice, Payment…)
    engine/                 # double-entry journalizer (pure functions), COGS, tax
    ports/                  # repository interfaces
  features/
    onboarding/
    dashboard/
    sales/
    purchases/
    payments/
    expenses/
    inventory/
    invoicing/
    accounting/             # ledger, trial balance, VAT summary
    settings/
    pos/                    # later phase
app/test/
  core/money_test.dart
  domain/engine/journalizer_test.dart
  domain/engine/tax_test.dart
  ...                       # pesewa-level money + tax + refund cases
```

## Build order

1. **Money + tax math** (`core/money.dart`, `domain/engine/tax.dart`) with unit tests —
   pesewa rounding, discount, VAT/levy, refunds. This is the "one rounding bug eats
   profit" risk, so it is built and tested first.
2. **Double-entry engine** (`domain/engine/journalizer.dart`) — the journalization table
   from the data model, with tests that debits == credits for every document type.
3. **Database** — drift schema for the full data model + migrations + seed chart of
   accounts and Ghana tax rates.
4. **Repositories** — CRUD + the report queries (ledger, trial balance, P&L, VAT summary).
5. **Onboarding + dashboard** — first screens, reading real data.
6. **Sales / purchases / payments / expenses / inventory** — the daily loop.
7. **Invoicing + PDF/WhatsApp + accounting reports.**
8. **POS (barcode + printer)**, then backup/export, then multi-shop polish.

## Clean-room note

The original proprietary APK is never decompiled for code or assets. Features are from
the public Play Store description and general accounting/POS knowledge. See
`../LICENCES.md`.
