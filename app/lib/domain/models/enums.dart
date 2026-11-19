// Domain enums shared by the engine, the database layer and the UI.
// Drift stores these as text (their `.name`) via `textEnum<T>()`.

enum AccountType { asset, liability, equity, income, expense }

enum PartyKind { customer, supplier, both }

enum UserRole { owner, cashier, accountant }

enum InvoiceKind { sale, purchase, quote }

enum InvoiceStatus { draft, quoted, issued, partiallyPaid, paid, voided }

enum PaymentDirection { received, made }

enum StockMovementType { sale, purchase, saleReturn, purchaseReturn, adjustment }

enum TaxKind { output, input }

enum JournalStatus { draft, posted }
