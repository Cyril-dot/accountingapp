import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../app_providers.dart';

class BackupScreen extends ConsumerStatefulWidget {
  final int shopId;
  const BackupScreen({super.key, required this.shopId});

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool _busy = false;
  String? _message;

  Future<void> _exportCsv() async {
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      final csv =
          await ref.read(exportServiceProvider).journalCsv(widget.shopId);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/sikabooks-journal.csv');
      await file.writeAsString(csv);
      await SharePlus.instance.share(ShareParams(
        files: [XFile(file.path)],
        subject: 'SikaBooks journal',
      ));
      if (mounted) setState(() => _message = 'Journal exported');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _backup() async {
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      final file =
          await ref.read(exportServiceProvider).backupDatabase();
      await SharePlus.instance.share(ShareParams(
        files: [XFile(file.path)],
        subject: 'SikaBooks backup',
      ));
      if (mounted) setState(() => _message = 'Backup created');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backup & export')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Export journal (CSV)'),
              subtitle: const Text('All transactions, opens in Excel'),
              trailing: _busy
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _busy ? null : _exportCsv,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup),
              title: const Text('Backup database'),
              subtitle: const Text('A full snapshot you can share'),
              trailing: _busy
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _busy ? null : _backup,
            ),
          ),
          if (_message != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(_message!, textAlign: TextAlign.center),
            ),
        ],
      ),
    );
  }
}
