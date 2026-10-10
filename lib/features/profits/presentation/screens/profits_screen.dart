import 'package:flutter/material.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';

class ProfitsScreen extends StatelessWidget {
  const ProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).profitsTitle)),
    );
  }
}
