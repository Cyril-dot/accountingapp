import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/core/invoice_pdf.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/onboarding_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  test('buildInvoicePdf produces a valid PDF document', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    final shopId = await OnboardingService(db).createBusiness(
      businessName: 'Adjoa Store',
      shopName: 'Main',
      ownerName: 'Adjoa',
      ownerPinHash: 'not-a-real-hash',
    );
    final cashId = (await (db.select(db.accounts)
              ..where((a) => a.shopId.equals(shopId))
              ..where((a) => a.code.equals('1000')))
            .getSingle())
        .id;
    final vatId = (await (db.select(db.taxRates)
              ..where((t) => t.name.equals('VAT')))
            .getSingle())
        .id;
    final partyId = await db.into(db.parties).insert(PartiesCompanion.insert(
          shopId: shopId,
          partyKind: PartyKind.customer,
          name: 'Ama Customer',
        ));
    final productId = await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'MILO',
          name: 'Milo 400g',
          unit: 'each',
          cost: const Value(900),
          price: const Value(1200),
          taxRateId: Value(vatId),
        ));

    final invoiceId = await SaleService(db).recordCashSale(
      shopId: shopId,
      partyId: partyId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 5),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo 400g',
          qtyThousandths: 2000,
          unitPricePesewas: 1200,
          taxRateId: vatId,
        ),
      ],
    );

    final invoice = (await (db.select(db.invoices)
          ..where((i) => i.id.equals(invoiceId)))
        .getSingle());
    final lines = (await (db.select(db.invoiceLines)
          ..where((l) => l.invoiceId.equals(invoiceId)))
        .get());
    final business = (await (db.select(db.businesses)..limit(1)).getSingle());
    final party = (await (db.select(db.parties)
          ..where((p) => p.id.equals(partyId)))
        .getSingle());

    final bytes = await buildInvoicePdf(
      business: business,
      party: party,
      invoice: invoice,
      lines: lines,
    );

    expect(bytes, isNotEmpty);
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
  });
}
