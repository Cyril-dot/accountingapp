import 'package:drift/drift.dart';

import '../../domain/models/enums.dart';

/// Adds `createdAt` (auto-set) and `updatedAt` (nullable, set on update) to a
/// table. Audit fields live on every table.
mixin Timestamped on Table {
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

/// Global business settings. Single row for single-shop mode; one row per
/// business when multi-shop is used.
@DataClassName('Business')
class Businesses extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get tin => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  TextColumn get currency => text().withDefault(const Constant('GHS'))();
  IntColumn get defaultTaxRateId => integer().nullable()();

}

@DataClassName('Shop')
class Shops extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get businessId => integer()();
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

}

@DataClassName('User')
class Users extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get fullName => text()();
  TextColumn get pinHash => text()();
  TextColumn get role => textEnum<UserRole>()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

}

/// The chart of accounts.
@DataClassName('Account')
class Accounts extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get accountType => textEnum<AccountType>()();
  TextColumn get subtype => text().nullable()();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get openingBalance =>
      integer().withDefault(const Constant(0))();

}

/// Tax rates are global (shared across shops). Rates are data, not code.
@DataClassName('TaxRate')
class TaxRates extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get rateBp => integer()();
  TextColumn get taxKind => textEnum<TaxKind>()();
  BoolColumn get isLevy => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

}

/// A customer, a supplier, or both.
@DataClassName('Party')
class Parties extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get partyKind => textEnum<PartyKind>()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get tin => text().nullable()();
  IntColumn get creditLimit => integer().nullable()();
  IntColumn get creditDays => integer().nullable()();
  IntColumn get openingBalance => integer().withDefault(const Constant(0))();

}

@DataClassName('Category')
class Categories extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get name => text()();
  IntColumn get parentId => integer().nullable()();

}

/// An inventory item. `stockOnHand` is a cache; the truth is `StockMovements`.
@DataClassName('Product')
class Products extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get sku => text()();
  TextColumn get barcode => text().nullable()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  IntColumn get categoryId => integer().nullable()();
  TextColumn get unit => text()();
  IntColumn get cost => integer().withDefault(const Constant(0))();
  IntColumn get price => integer().withDefault(const Constant(0))();
  IntColumn get taxRateId => integer().nullable()();
  IntColumn get stockOnHand => integer().withDefault(const Constant(0))();
  IntColumn get reorderLevel => integer().withDefault(const Constant(0))();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

}

@DataClassName('PaymentMethod')
class PaymentMethods extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get name => text()();
  IntColumn get accountId => integer()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

}

/// A sale, purchase or quote document.
@DataClassName('Invoice')
class Invoices extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get number => text()();
  TextColumn get invoiceKind => textEnum<InvoiceKind>()();
  IntColumn get partyId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get invoiceStatus => textEnum<InvoiceStatus>()();
  IntColumn get subtotal => integer()();
  IntColumn get discountTotal => integer()();
  IntColumn get taxTotal => integer()();
  IntColumn get total => integer()();
  IntColumn get paidTotal => integer().withDefault(const Constant(0))();
  TextColumn get reference => text().nullable()();
  TextColumn get notes => text().nullable()();

}

@DataClassName('InvoiceLine')
class InvoiceLines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer()();
  IntColumn get productId => integer().nullable()();
  TextColumn get description => text()();
  IntColumn get qty => integer()(); // thousandths
  IntColumn get unitPrice => integer()();
  IntColumn get discount => integer().withDefault(const Constant(0))();
  IntColumn get taxRateId => integer().nullable()();
  IntColumn get taxAmount => integer()();
  IntColumn get lineTotal => integer()();

}

@DataClassName('Payment')
class Payments extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get number => text()();
  TextColumn get direction => textEnum<PaymentDirection>()();
  IntColumn get partyId => integer()();
  DateTimeColumn get date => dateTime()();
  IntColumn get methodId => integer()();
  IntColumn get amount => integer()();
  TextColumn get reference => text().nullable()();
  TextColumn get notes => text().nullable()();

}

@DataClassName('PaymentAllocation')
class PaymentAllocations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get paymentId => integer()();
  IntColumn get invoiceId => integer()();
  IntColumn get amount => integer()();

}

@DataClassName('Expense')
class Expenses extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  DateTimeColumn get date => dateTime()();
  IntColumn get accountId => integer()();
  IntColumn get supplierId => integer().nullable()();
  IntColumn get amount => integer()();
  IntColumn get taxInput => integer().withDefault(const Constant(0))();
  IntColumn get methodId => integer().nullable()();
  TextColumn get notes => text().nullable()();

}

/// The source of truth for inventory. A sale is negative, a purchase positive.
@DataClassName('StockMovement')
class StockMovements extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  IntColumn get productId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get movementType => textEnum<StockMovementType>()();
  IntColumn get deltaQty => integer()(); // thousandths, signed
  IntColumn get unitCost => integer()();
  TextColumn get refType => text()();
  IntColumn get refId => integer().nullable()();
  TextColumn get note => text().nullable()();

}

@DataClassName('JournalEntry')
class JournalEntries extends Table with Timestamped {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get shopId => integer()();
  TextColumn get number => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get memo => text()();
  TextColumn get refType => text()();
  IntColumn get refId => integer().nullable()();
  TextColumn get journalStatus => textEnum<JournalStatus>()();

}

@DataClassName('JournalLine')
class JournalLines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get entryId => integer()();
  IntColumn get accountId => integer()();
  IntColumn get debit => integer().withDefault(const Constant(0))();
  IntColumn get credit => integer().withDefault(const Constant(0))();

}
