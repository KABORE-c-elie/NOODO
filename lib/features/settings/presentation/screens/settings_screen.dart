import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';

const _maxRatePercent = 10.0;
const _rateStepPercent = 0.5;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle(l10n.languageSection),
          const _LanguageSelector(),
          const SizedBox(height: 24),
          _SectionTitle(l10n.taxSection),
          const _TaxRateSlider(),
          const _TaxDueDate(),
          const SizedBox(height: 24),
          _SectionTitle(l10n.alertsSection),
          const _SensitivitySelector(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Semantics(
    header: true,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    ),
  );
}

class _LanguageSelector extends ConsumerWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final languageCode = ref.watch(appLocaleProvider).languageCode;
    return SegmentedButton<String>(
      showSelectedIcon: false,
      selected: {languageCode},
      onSelectionChanged: (selection) =>
          ref.read(settingsRepositoryProvider).setLanguage(selection.first),
      segments: [
        for (final (code, label) in [
          ('fr', l10n.languageFrench),
          ('en', l10n.languageEnglish),
        ])
          ButtonSegment(value: code, label: Text(label), tooltip: label),
      ],
    );
  }
}

class _TaxRateSlider extends ConsumerStatefulWidget {
  const _TaxRateSlider();

  @override
  ConsumerState<_TaxRateSlider> createState() => _TaxRateSliderState();
}

class _TaxRateSliderState extends ConsumerState<_TaxRateSlider> {
  double? _dragValue;

  Future<void> _save(double percent) async {
    final repository = ref.read(nodeRepositoryProvider);
    final taxNode = await repository.getTaxNode();
    await repository.updateTaxNode(
      taxNode.copyWith(rateBasisPoints: (percent * 100).round()),
    );
    if (mounted) setState(() => _dragValue = null);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final stored = ref.watch(
      taxNodeProvider.select((node) => node.value?.ratePercent),
    );
    if (stored == null) return const LinearProgressIndicator();
    final value = _dragValue ?? stored;
    final label = l10n.taxRate(
      NumberFormat.decimalPattern(locale).format(value),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value,
          max: _maxRatePercent,
          divisions: (_maxRatePercent / _rateStepPercent).round(),
          label: label,
          semanticFormatterCallback: (_) => label,
          onChanged: (newValue) => setState(() => _dragValue = newValue),
          onChangeEnd: _save,
        ),
        Text(
          l10n.taxRateExplanation,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _TaxDueDate extends ConsumerWidget {
  const _TaxDueDate();

  Future<void> _pick(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final scheduler = ref.read(reminderSchedulerProvider);
    final repository = ref.read(nodeRepositoryProvider);
    final today = ref.read(currentDayProvider);
    final taxNode = await repository.getTaxNode();
    if (!context.mounted) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: taxNode.nextDueDate ?? today,
      firstDate: today,
      lastDate: DateTime(today.year + 2),
    );
    if (picked == null) return;
    await repository.updateTaxNode(taxNode.copyWith(nextDueDate: picked));
    await requestReminderPermission(
      scheduler: scheduler,
      messenger: messenger,
      deniedMessage: l10n.notificationsDenied,
    );
  }

  Future<void> _clear(WidgetRef ref) async {
    final repository = ref.read(nodeRepositoryProvider);
    final taxNode = await repository.getTaxNode();
    await repository.updateTaxNode(taxNode.copyWith(nextDueDate: null));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dueDate = ref.watch(
      taxNodeProvider.select((node) => node.value?.nextDueDate),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            child: Tooltip(
              message: l10n.chooseTaxDueDate,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.event),
                label: Text(
                  dueDate == null
                      ? l10n.chooseTaxDueDate
                      : l10n.taxNextDue(
                          DateFormat.yMMMMd(locale).format(dueDate),
                        ),
                ),
                onPressed: () => _pick(context, ref),
              ),
            ),
          ),
          if (dueDate != null)
            IconButton(
              tooltip: l10n.clearDueDate,
              icon: const Icon(Icons.clear),
              onPressed: () => _clear(ref),
            ),
        ],
      ),
    );
  }
}

class _SensitivitySelector extends ConsumerWidget {
  const _SensitivitySelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final sensitivity = ref.watch(alertSensitivityProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButton<AlertSensitivity>(
          showSelectedIcon: false,
          selected: {sensitivity},
          onSelectionChanged: (selection) => ref
              .read(settingsRepositoryProvider)
              .setAlertSensitivity(selection.first),
          segments: [
            for (final (value, label) in [
              (AlertSensitivity.low, l10n.sensitivityLow),
              (AlertSensitivity.normal, l10n.sensitivityNormal),
              (AlertSensitivity.high, l10n.sensitivityHigh),
            ])
              ButtonSegment(value: value, label: Text(label), tooltip: label),
          ],
        ),
        const SizedBox(height: 8),
        Text(switch (sensitivity) {
          AlertSensitivity.low => l10n.sensitivityLowHelp,
          AlertSensitivity.normal => l10n.sensitivityNormalHelp,
          AlertSensitivity.high => l10n.sensitivityHighHelp,
        }, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
