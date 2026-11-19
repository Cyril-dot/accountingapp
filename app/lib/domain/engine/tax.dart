/// Integer half-up division: rounds `numerator / denominator` to the nearest
/// integer, ties away from zero. All money rounding goes through this one
/// function so the app never depends on floating point.
///
/// Examples (all integers): 1/2 -> 1, 3/2 -> 2, 2/3 -> 1, 1/3 -> 0,
/// -1/2 -> -1 (ties away from zero).
int roundDiv(int numerator, int denominator) {
  if (denominator == 0) {
    throw ArgumentError('denominator must not be zero');
  }
  if (denominator < 0) {
    numerator = -numerator;
    denominator = -denominator;
  }
  final q = numerator ~/ denominator; // truncates toward zero
  final r = numerator.remainder(denominator);
  if ((r * 2).abs() >= denominator) {
    return numerator.isNegative ? q - 1 : q + 1;
  }
  return q;
}

/// A tax rate expressed in basis points (1% == 100 bp). Ghana VAT 15% == 1500,
/// NHIL 2.5% == 250, GETFund 2.5% == 250, COVID-19 levy 1% == 100.
class TaxRate {
  final String name;

  /// Rate in basis points; must be >= 0.
  final int rateBp;

  /// True for the NHIL / GETFund / COVID levies, which are reported separately
  /// from VAT rather than folded into the VAT input/output summary.
  final bool isLevy;

  const TaxRate({required this.name, required this.rateBp, this.isLevy = false})
      : assert(rateBp >= 0, 'rateBp must be >= 0');

  /// Tax on [amountPesewas], rounded half-up to the nearest pesewa.
  int taxOn(int amountPesewas) => roundDiv(amountPesewas * rateBp, 10000);

  /// The amount plus its tax.
  int applyTo(int amountPesewas) => amountPesewas + taxOn(amountPesewas);
}

/// Standard Ghana rates. Rates are data, not code, so they can be changed in
/// the database without a release; these are the out-of-the-box defaults.
const ghanaVat = TaxRate(name: 'VAT', rateBp: 1500);
const ghanaNhil = TaxRate(name: 'NHIL', rateBp: 250, isLevy: true);
const ghanaGetFund = TaxRate(name: 'GETFund', rateBp: 250, isLevy: true);
const ghanaCovidLevy = TaxRate(name: 'COVID-19 Levy', rateBp: 100, isLevy: true);
const ghanaZeroRated = TaxRate(name: 'Zero-rated', rateBp: 0);
const ghanaExempt = TaxRate(name: 'Exempt', rateBp: 0);

/// Net line amount from a unit price (pesewas) and a quantity in thousandths.
/// Example: 1.250 kg at GH₵ 2.00 -> `lineNetPesewas(200, 1250) == 250`.
int lineNetPesewas(int unitPricePesewas, int qtyThousandths) {
  return roundDiv(unitPricePesewas * qtyThousandths, 1000);
}

/// Applies a pesewa discount to a net amount, clamped at zero (a discount can
/// never make a line negative).
int applyDiscount(int netPesewas, int discountPesewas) {
  final v = netPesewas - discountPesewas;
  return v < 0 ? 0 : v;
}

/// The money result of one invoice line.
class LineTotals {
  final int netPesewas; // quantity x unit price, before discount
  final int discountPesewas;
  final int taxablePesewas; // net - discount
  final int taxPesewas; // tax on the taxable amount
  final int totalPesewas; // taxable + tax

  const LineTotals({
    required this.netPesewas,
    required this.discountPesewas,
    required this.taxablePesewas,
    required this.taxPesewas,
    required this.totalPesewas,
  });
}

/// Computes the totals of a single invoice line, applying discount and tax in
/// that order. All results are integer pesewas, rounded half-up.
LineTotals computeLine({
  required int unitPricePesewas,
  required int qtyThousandths,
  int discountPesewas = 0,
  TaxRate? taxRate,
}) {
  final net = lineNetPesewas(unitPricePesewas, qtyThousandths);
  final taxable = applyDiscount(net, discountPesewas);
  final tax = taxRate == null ? 0 : taxRate.taxOn(taxable);
  return LineTotals(
    netPesewas: net,
    discountPesewas: discountPesewas,
    taxablePesewas: taxable,
    taxPesewas: tax,
    totalPesewas: taxable + tax,
  );
}
