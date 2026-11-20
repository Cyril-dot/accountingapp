import '../../core/pin_hasher.dart';
import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// Verifies a shop PIN against its active users. Returns the matched user, or
/// null if the PIN is wrong.
class AuthService {
  final AppDatabase db;
  AuthService(this.db);

  Future<User?> verifyPin(int shopId, String pin) async {
    final users = await (db.select(db.users)
          ..where((u) => u.shopId.equals(shopId))
          ..where((u) => u.isActive.equals(true)))
        .get();
    for (final u in users) {
      if (PinHasher.verify(pin, u.pinHash)) return u;
    }
    return null;
  }

  Future<List<User>> users(int shopId) =>
      (db.select(db.users)..where((u) => u.shopId.equals(shopId))).get();

  Future<int> addUser({
    required int shopId,
    required String fullName,
    required String pinHash,
    required UserRole role,
  }) {
    return db.into(db.users).insert(
          UsersCompanion.insert(
            shopId: shopId,
            fullName: fullName,
            pinHash: pinHash,
            role: role,
          ),
        );
  }
}
