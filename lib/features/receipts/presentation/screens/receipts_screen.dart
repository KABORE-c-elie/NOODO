import 'package:flutter/material.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).receiptsTitle)),
    );
  }
}
