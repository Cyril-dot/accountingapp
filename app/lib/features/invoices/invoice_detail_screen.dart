import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../app_providers.dart';
import '../../core/invoice_pdf.dart';
import '../../core/money.dart';
import '../../data/db/app_database.dart';

class InvoiceDetailScreen extends ConsumerStatefulWidget {
  final int shopId;
  final int invoiceId;
  const InvoiceDetailScreen({
    super.key,
    required this.shopId,
    required this.invoiceId,
  });

  @override
  ConsumerState<InvoiceDetailScreen> createState() =>
      _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends ConsumerState<InvoiceDetailScreen> {
  Invoice? _invoice;
  List<InvoiceLine> _lines = [];
  Business? _business;
  Party? _party;
  bool _loading = true;
  bool _sharing = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(catalogRepositoryProvider);
    final invoice = await repo.invoice(widget.invoiceId);
    if (invoice == null) return;
    final lines = await repo.invoiceLines(widget.invoiceId);
    final business = await repo.firstBusiness();
    final party = await repo.party(invoice.partyId);
    if (mounted) {
      setState(() {
        _invoice = invoice;
        _lines = lines;
        _business = business;
        _party = party;
        _loading = false;
      });
    }
  }

  Future<void> _sharePdf() async {
    final invoice = _invoice;
    final business = _business;
    final party = _party;
    if (invoice == null || business == null || party == null) return;
    setState(() => _sharing = true);
    try {
      final bytes = await buildInvoicePdf(
        business: business,
        party: party,
        invoice: invoice,
        lines: _lines,
      );
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/invoice-${invoice.number}.pdf');
      await file.writeAsBytes(bytes);
      await SharePlus.instance.share(ShareParams(
        files: [XFile(file.path)],
        subject: 'Invoice ${invoice.number}',
      ));
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Invoice')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final inv = _invoice!;
    return Scaffold(
      appBar: AppBar(
        title: Text(inv.number),
        actions: [
          IconButton(
            key: const Key('sharePdf'),
            icon: _sharing
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.ios_share),
            onPressed: _sharing ? null : _sharePdf,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${inv.invoiceKind.name} · ${inv.invoiceStatus.name}'),
            subtitle: Text('${_party?.name ?? '—'} · ${_date(inv.date)}'),
          ),
          const Divider(),
          for (final l in _lines)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(l.description),
              subtitle: Text('${_qty(l.qty)} × ${Money(l.unitPrice).format()}'),
              trailing: Text(Money(l.lineTotal).format()),
            ),
          const Divider(),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: const Text('Subtotal'),
            trailing: Text(Money(inv.subtotal).format()),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: const Text('Tax'),
            trailing: Text(Money(inv.taxTotal).format()),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Total',
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(Money(inv.total).format(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  static String _qty(int thousandths) {
    final whole = thousandths ~/ 1000;
    final frac = thousandths % 1000;
    if (frac == 0) return '$whole';
    final s = frac.toString().padLeft(3, '0').replaceAll(RegExp(r'0+$'), '');
    return '$whole.$s';
  }

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
