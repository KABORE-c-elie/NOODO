import 'package:flutter/material.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';

class CreditorScreen extends StatelessWidget {
  const CreditorScreen({super.key, required this.creditorId});

  final String creditorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).creditorTitle)),
    );
  }
}
