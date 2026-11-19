import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/core/money.dart';

void main() {
  group('Money.parse', () {
    test('parses cedis and pesewas', () {
      expect(Money.parse('12.50').pesewas, 1250);
      expect(Money.parse('12.5').pesewas, 1250);
      expect(Money.parse('12').pesewas, 1200);
      expect(Money.parse('0.05').pesewas, 5);
      expect(Money.parse('0.5').pesewas, 50);
    });

    test('parses negatives', () {
      expect(Money.parse('-3.25').pesewas, -325);
      expect(Money.parse('-12').pesewas, -1200);
    });

    test('ignores thousands commas', () {
      expect(Money.parse('1,234.56').pesewas, 123456);
    });

    test('rejects malformed input', () {
      expect(() => Money.parse(''), throwsFormatException);
      expect(() => Money.parse('abc'), throwsFormatException);
      expect(() => Money.parse('1.234'), throwsFormatException);
      expect(() => Money.parse('1.2.3'), throwsFormatException);
    });
  });

  group('Money constructors', () {
    test('fromCedis', () {
      expect(Money.fromCedis(12).pesewas, 1200);
    });

    test('fromCedisAndPesewas', () {
      expect(Money.fromCedisAndPesewas(12, 50).pesewas, 1250);
      expect(Money.fromCedisAndPesewas(0, 5).pesewas, 5);
    });
  });

  group('Money arithmetic', () {
    test('add and subtract', () {
      final a = Money.parse('12.50');
      final b = Money.parse('0.75');
      expect((a + b).pesewas, 1325);
      expect((a - b).pesewas, 1175);
    });

    test('scale and negate', () {
      expect((Money(500) * 3).pesewas, 1500);
      expect((-Money(500)).pesewas, -500);
      expect(Money(-500).abs().pesewas, 500);
    });
  });

  group('Money.format', () {
    test('formats cedis with grouping', () {
      expect(Money(123456).format(), 'GH₵ 1,234.56');
      expect(Money(100000000).format(), 'GH₵ 1,000,000.00');
      expect(Money(0).format(), 'GH₵ 0.00');
      expect(Money(5).format(), 'GH₵ 0.05');
    });

    test('formats negatives', () {
      expect(Money(-45).format(), '-GH₵ 0.45');
      expect(Money(-123456).format(), '-GH₵ 1,234.56');
    });
  });

  group('Money equality and comparison', () {
    test('equality is by pesewas', () {
      expect(Money(1250), Money.parse('12.50'));
      expect(Money(1250).hashCode, Money.parse('12.50').hashCode);
    });

    test('comparison', () {
      expect(Money(100) < Money(200), isTrue);
      expect(Money(200) >= Money(200), isTrue);
      expect(Money.zero.isZero, isTrue);
    });
  });
}
