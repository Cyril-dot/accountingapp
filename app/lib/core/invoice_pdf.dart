import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/db/app_database.dart';
import '../domain/models/enums.dart';
import 'money.dart';

/// Renders a sale/purchase invoice to a PDF document (pure Dart; no platform
/// code), ready to be shared. Returns the PDF bytes.
Future<Uint8List> buildInvoicePdf({
  required Business business,
  required Party party,
  required Invoice invoice,
  required List<InvoiceLine> lines,
}) async {
  final doc = pw.Document();
  final kind = invoice.invoiceKind == InvoiceKind.purchase
      ? 'PURCHASE'
      : invoice.invoiceKind == InvoiceKind.quote
          ? 'QUOTE'
          : 'INVOICE';

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Padding(
        padding: const pw.EdgeInsets.all(32),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(business.name,
                style: const pw.TextStyle(
                    fontSize: 20, fontWeight: pw.FontWeight.bold)),
            if (business.phone != null) pw.Text(business.phone!),
            if (business.address != null) pw.Text(business.address!),
            if (business.tin != null) pw.Text('TIN: ${business.tin}'),
            pw.SizedBox(height: 20),
            pw.Text('$kind ${invoice.number}',
                style: const pw.TextStyle(
                    fontSize: 15, fontWeight: pw.FontWeight.bold)),
            pw.Text('Date: ${_date(invoice.date)}'),
            pw.SizedBox(height: 12),
            pw.Text('To: ${party.name}'),
            if (party.phone != null) pw.Text(party.phone!),
            pw.SizedBox(height: 20),
            _table(invoice, lines),
            pw.SizedBox(height: 20),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                'Total: ${Money(invoice.total).format()}',
                style: const pw.TextStyle(
                    fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return doc.save();
}

pw.Widget _table(Invoice invoice, List<InvoiceLine> lines) {
  const bold = pw.TextStyle(fontWeight: pw.FontWeight.bold);
  final header = pw.TableRow(children: [
    pw.Text('Item', style: bold),
    pw.Text('Qty', style: bold),
    pw.Text('Unit', style: bold),
    pw.Text('Tax', style: bold),
    pw.Text('Total', style: bold),
  ]);
  final rows = [
    for (final l in lines)
      pw.TableRow(children: [
        pw.Text(l.description),
        pw.Text(_qty(l.qty)),
        pw.Text(Money(l.unitPrice).format()),
        pw.Text(Money(l.taxAmount).format()),
        pw.Text(Money(l.lineTotal).format()),
      ]),
    pw.TableRow(children: [
      pw.Text('Subtotal', style: bold),
      pw.Text(''),
      pw.Text(''),
      pw.Text(Money(invoice.taxTotal).format()),
      pw.Text(Money(invoice.subtotal).format()),
    ]),
  ];
  return pw.Table(
    border: pw.TableBorder.all(),
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [header, ...rows],
  );
}

String _qty(int thousandths) {
  final whole = thousandths ~/ 1000;
  final frac = thousandths % 1000;
  if (frac == 0) return '$whole';
  final s = frac.toString().padLeft(3, '0').replaceAll(RegExp(r'0+$'), '');
  return '$whole.$s';
}

String _date(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
