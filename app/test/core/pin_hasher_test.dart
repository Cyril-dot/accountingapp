import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/core/pin_hasher.dart';

void main() {
  test('hash verifies the correct pin', () {
    final h = PinHasher.hash('1234', iterations: 100);
    expect(PinHasher.verify('1234', h), isTrue);
  });

  test('rejects a wrong pin', () {
    final h = PinHasher.hash('1234', iterations: 100);
    expect(PinHasher.verify('9999', h), isFalse);
  });

  test('two hashes of the same pin differ (random salt)', () {
    final a = PinHasher.hash('1234', iterations: 100);
    final b = PinHasher.hash('1234', iterations: 100);
    expect(a, isNot(b));
    expect(PinHasher.verify('1234', a), isTrue);
    expect(PinHasher.verify('1234', b), isTrue);
  });

  test('never stores the plaintext pin', () {
    final h = PinHasher.hash('4321', iterations: 100);
    expect(h.contains('4321'), isFalse);
  });

  test('malformed stored strings fail cleanly', () {
    expect(PinHasher.verify('1234', ''), isFalse);
    expect(PinHasher.verify('1234', 'abc'), isFalse);
    expect(PinHasher.verify('1234', r'100$notbase64$notbase64'), isFalse);
  });
}
