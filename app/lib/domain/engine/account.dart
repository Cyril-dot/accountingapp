/// The five double-entry account types.
enum AccountType { asset, liability, equity, income, expense }

/// A chart-of-accounts entry, reduced to what the journal engine needs.
class Account {
  final String id;
  final String name;
  final AccountType type;

  const Account({required this.id, required this.name, required this.type});
}
