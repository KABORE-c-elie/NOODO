import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({super.key});

  static const _size = 112.0;

  @override
  Widget build(BuildContext context) {
    final label = AppLocalizations.of(context).recordTransaction;
    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        label: label,
        excludeSemantics: true,
        child: SizedBox.square(
          dimension: _size,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
            ),
            onPressed: () => context.push(AppRoutes.confirmationPath()),
            child: const Icon(Icons.mic, size: 56),
          ),
        ),
      ),
    );
  }
}
