import 'package:flutter/foundation.dart';

/// An amount of money in Ghana pesewas (1 cedi = 100 pesewas).
///
/// All accounting math uses this integer type. Floating point never touches
/// money, so totals never drift by a pesewa. Values may be positive, zero or
/// negative (negative = the opposite direction, settled at the journal level).
@immutable
class Money implements Comparable<Money> {
  /// Pesewas, always an integer.
  final int pesewas;

  const Money(this.pesewas);

  static const Money zero = Money(0);

  /// Whole cedis, e.g. `Money.fromCedis(12) == 1200` pesewas.
  const Money.fromCedis(int cedis) : pesewas = cedis * 100;

  /// Cedis and pesewas, e.g. `Money.fromCedisAndPesewas(12, 50) == 1250`.
  const Money.fromCedisAndPesewas(int cedis, int pesewas)
      : pesewas = cedis * 100 + pesewas;

  /// Parses strings like "12.50", "12", "12.5", "0.05", "-3.25".
  /// Throws [FormatException] on malformed input.
  factory Money.parse(String text) {
    final t = text.trim().replaceAll(',', '');
    if (t.isEmpty) {
      throw const FormatException('empty amount');
    }
    final negative = t.startsWith('-');
    final s = negative ? t.substring(1) : t;
    final parts = s.split('.');
    if (parts.length > 2) {
      throw FormatException('too many decimal points: $text');
    }
    final cedis =
        int.tryParse(parts[0]) ?? (throw FormatException('bad cedis: $text'));
    var pesewas = 0;
    if (parts.length == 2) {
      var frac = parts[1];
      if (frac.isEmpty) frac = '0';
      if (frac.length > 2) {
        throw FormatException('at most 2 decimal places: $text');
      }
      pesewas = int.parse(frac.padRight(2, '0'));
    }
    final value = cedis * 100 + pesewas;
    return Money(negative ? -value : value);
  }

  Money operator +(Money other) => Money(pesewas + other.pesewas);
  Money operator -(Money other) => Money(pesewas - other.pesewas);
  Money operator -() => Money(-pesewas);
  Money operator *(int factor) => Money(pesewas * factor);

  Money abs() => Money(pesewas.abs());
  bool get isNegative => pesewas < 0;
  bool get isZero => pesewas == 0;

  @override
  int compareTo(Money other) => pesewas.compareTo(other.pesewas);
  bool operator <(Money other) => pesewas < other.pesewas;
  bool operator <=(Money other) => pesewas <= other.pesewas;
  bool operator >(Money other) => pesewas > other.pesewas;
  bool operator >=(Money other) => pesewas >= other.pesewas;

  @override
  bool operator ==(Object other) => other is Money && other.pesewas == pesewas;

  @override
  int get hashCode => pesewas.hashCode;

  /// Formats as e.g. "GH₵ 1,234.56" or "-GH₵ 0.45".
  String format({String symbol = 'GH₵'}) {
    final negative = pesewas < 0;
    final a = pesewas.abs();
    final cedis = a ~/ 100;
    final pesewasPart = (a % 100).toString().padLeft(2, '0');
    final body = '$symbol ${_groupThousands(cedis)}.$pesewasPart';
    return negative ? '-$body' : body;
  }

  static String _groupThousands(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final fromEnd = s.length - i;
      buf.write(s[i]);
      if (fromEnd > 1 && (fromEnd - 1) % 3 == 0) buf.write(',');
    }
    return buf.toString();
  }

  @override
  String toString() => format();
}
