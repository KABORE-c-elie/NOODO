import 'package:flutter/material.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).confirmationTitle),
      ),
    );
  }
}
