import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

/// Hashes and verifies user PINs with PBKDF2-HMAC-SHA256 and a random salt.
/// The stored string is `iterations$salt$hash` (base64), so the iteration count
/// can be raised later without breaking old hashes. A PIN is never stored or
/// logged in plaintext.
class PinHasher {
  /// Production iteration count. Kept modest because this runs in pure Dart on
  /// low-end phones on every unlock. The stored string records the count, so it
  /// can be raised later without breaking existing hashes.
  static const int defaultIterations = 30000;
  static const int saltBytes = 16;
  static const int keyBytes = 32;

  static String hash(String pin, {int iterations = defaultIterations}) {
    final salt = _randomBytes(saltBytes);
    final key = _pbkdf2(pin, salt, iterations, keyBytes);
    return '$iterations\$${base64Encode(salt)}\$${base64Encode(key)}';
  }

  static bool verify(String pin, String stored) {
    final parts = stored.split(r'$');
    if (parts.length != 3) return false;
    final iterations = int.tryParse(parts[0]);
    if (iterations == null || iterations <= 0) return false;
    List<int> salt;
    List<int> expected;
    try {
      salt = base64Decode(parts[1]);
      expected = base64Decode(parts[2]);
    } on FormatException {
      return false;
    }
    final key = _pbkdf2(pin, salt, iterations, expected.length);
    return _constantTimeEquals(key, expected);
  }

  static Uint8List _pbkdf2(
      String pin, List<int> salt, int iterations, int keyLength) {
    final hmac = Hmac(sha256, utf8.encode(pin));

    final blockIndex = Uint8List(4);
    ByteData.sublistView(blockIndex).setUint32(0, 1); // INT_32_BE(1), big-endian

    var u = Uint8List.fromList(hmac.convert([...salt, ...blockIndex]).bytes);
    var result = u;
    for (var i = 1; i < iterations; i++) {
      u = Uint8List.fromList(hmac.convert(u).bytes);
      result = _xor(result, u);
    }
    return Uint8List.fromList(result.sublist(0, keyLength));
  }

  static Uint8List _xor(List<int> a, List<int> b) {
    final out = Uint8List(a.length);
    for (var i = 0; i < a.length; i++) {
      out[i] = a[i] ^ b[i];
    }
    return out;
  }

  static bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }

  static Uint8List _randomBytes(int n) {
    final rng = Random.secure();
    return Uint8List.fromList(List<int>.generate(n, (_) => rng.nextInt(256)));
  }
}
