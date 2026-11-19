import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/domain/engine/tax.dart';

void main() {
  group('roundDiv', () {
    test('rounds half up', () {
      expect(roundDiv(1, 2), 1);
      expect(roundDiv(3, 2), 2);
      expect(roundDiv(2, 2), 1);
      expect(roundDiv(1500, 1000), 2);
      expect(roundDiv(1250, 1000), 1);
      expect(roundDiv(1499, 1000), 1);
    });

    test('rounds down below half', () {
      expect(roundDiv(1, 3), 0);
      expect(roundDiv(2, 3), 1);
      expect(roundDiv(2499, 1000), 2);
    });

    test('ties away from zero for negatives', () {
      expect(roundDiv(-1, 2), -1);
      expect(roundDiv(-3, 2), -2);
      expect(roundDiv(-1, 3), 0);
    });
  });

  group('TaxRate', () {
    test('15% VAT on a whole amount', () {
      expect(ghanaVat.taxOn(10000), 1500); // GH₵100 -> GH₵15
    });

    test('15% VAT rounds half-up to the pesewa', () {
      expect(ghanaVat.taxOn(999), 150); // 149.85 -> 150
      expect(ghanaVat.taxOn(1000), 150); // exactly 150
      expect(ghanaVat.taxOn(333), 50); // 49.95 -> 50
    });

    test('levy at 2.5%', () {
      expect(ghanaNhil.taxOn(10000), 250); // GH₵100 -> GH₵2.50
      expect(ghanaNhil.taxOn(100), 3); // 2.5 -> 3 (half-up)
    });

    test('applyTo adds tax', () {
      expect(ghanaVat.applyTo(10000), 11500);
    });

    test('zero and exempt rates add nothing', () {
      expect(ghanaZeroRated.taxOn(12345), 0);
      expect(ghanaExempt.taxOn(12345), 0);
    });
  });

  group('lineNetPesewas', () {
    test('quantity in thousandths', () {
      expect(lineNetPesewas(200, 1250), 250); // 1.250kg @ GH₵2.00
      expect(lineNetPesewas(200, 1000), 200); // 1kg
      expect(lineNetPesewas(1200, 2000), 2400); // 2 @ GH₵12
    });

    test('rounds half-up on fractional pesewa', () {
      expect(lineNetPesewas(250, 333), 83); // 83.25 -> 83
      expect(lineNetPesewas(250, 334), 84); // 83.5 -> 84
    });
  });

  group('computeLine', () {
    test('net + VAT, no discount', () {
      final t = computeLine(
        unitPricePesewas: 1200, // GH₵12
        qtyThousandths: 2000, // 2
        taxRate: ghanaVat,
      );
      expect(t.netPesewas, 2400);
      expect(t.discountPesewas, 0);
      expect(t.taxablePesewas, 2400);
      expect(t.taxPesewas, 360); // 15% of 2400
      expect(t.totalPesewas, 2760);
    });

    test('discount applies before tax', () {
      final t = computeLine(
        unitPricePesewas: 1000, // GH₵10
        qtyThousandths: 1000, // 1
        discountPesewas: 100, // GH₵1
        taxRate: ghanaVat,
      );
      expect(t.netPesewas, 1000);
      expect(t.discountPesewas, 100);
      expect(t.taxablePesewas, 900);
      expect(t.taxPesewas, 135); // 15% of 900
      expect(t.totalPesewas, 1035);
    });

    test('discount clamps at zero', () {
      final t = computeLine(
        unitPricePesewas: 100,
        qtyThousandths: 1000,
        discountPesewas: 150,
        taxRate: ghanaVat,
      );
      expect(t.taxablePesewas, 0);
      expect(t.taxPesewas, 0);
      expect(t.totalPesewas, 0);
    });
  });
}
