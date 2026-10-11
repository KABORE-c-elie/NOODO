import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:noodo/features/receipts/presentation/photo_actions.dart';
import 'package:noodo/features/receipts/presentation/widgets/attach_photo_sheet.dart';
import 'package:noodo/features/receipts/presentation/widgets/photo_thumbnail.dart';

class ReceiptsScreen extends ConsumerWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.receiptsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: l10n.takePhotoTooltip,
        icon: const Icon(Icons.photo_camera_outlined),
        label: Text(l10n.takePhoto),
        onPressed: () => takeAndAttachPhoto(context, ref),
      ),
      body: const Column(
        children: [
          _PhotoFilters(),
          Expanded(child: _PhotoGrid()),
        ],
      ),
    );
  }
}

class _PhotoFilters extends ConsumerWidget {
  const _PhotoFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final filter = ref.watch(photoFilterControllerProvider);
    final controller = ref.read(photoFilterControllerProvider.notifier);
    final creditors = ref.watch(creditorsProvider).value ?? const [];
    final creditorId = filter.creditorId;
    final creditorName = creditors
        .where((c) => c.id == creditorId)
        .map((c) => c.supplierName)
        .firstOrNull;
    final range = filter.range;
    final dateFormat = DateFormat.yMMMd(locale);

    Future<void> pickCreditor() => showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: RadioGroup<String?>(
          groupValue: creditorId,
          onChanged: (value) {
            controller.setCreditor(value);
            Navigator.of(sheetContext).pop();
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              RadioListTile<String?>(
                value: null,
                title: Text(l10n.allCreditors),
              ),
              for (final creditor in creditors)
                RadioListTile<String?>(
                  value: creditor.id,
                  title: Text(creditor.supplierName),
                ),
            ],
          ),
        ),
      ),
    );

    Future<void> pickRange() async {
      final today = ref.read(currentDayProvider);
      final picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(today.year - 5),
        lastDate: today,
      );
      if (picked == null) return;
      controller.setRange(
        DateRange(
          start: picked.start,
          end: DateTime(picked.end.year, picked.end.month, picked.end.day + 1),
        ),
      );
    }

    return SizedBox(
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          InputChip(
            avatar: const Icon(Icons.person_outline, size: 18),
            label: Text(creditorName ?? l10n.allCreditors),
            tooltip: l10n.filterByCreditor,
            selected: creditorId != null,
            showCheckmark: false,
            onPressed: pickCreditor,
            onDeleted: creditorId == null
                ? null
                : () => controller.setCreditor(null),
            deleteButtonTooltipMessage: l10n.clearFilter,
          ),
          const SizedBox(width: 8),
          InputChip(
            avatar: const Icon(Icons.date_range, size: 18),
            label: Text(
              range == null
                  ? l10n.allDates
                  : l10n.periodRange(
                      dateFormat.format(range.start),
                      dateFormat.format(
                        range.end.subtract(const Duration(days: 1)),
                      ),
                    ),
            ),
            tooltip: l10n.filterByDate,
            selected: range != null,
            showCheckmark: false,
            onPressed: pickRange,
            onDeleted: range == null ? null : () => controller.setRange(null),
            deleteButtonTooltipMessage: l10n.clearFilter,
          ),
        ],
      ),
    );
  }
}

class _PhotoGrid extends ConsumerWidget {
  const _PhotoGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final filter = ref.watch(photoFilterControllerProvider);
    final photos = ref.watch(
      photosProvider(
        PhotoQuery(creditorId: filter.creditorId, range: filter.range),
      ),
    );
    return switch (photos) {
      AsyncData(:final value) when value.isEmpty => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.noPhotos, textAlign: TextAlign.center),
        ),
      ),
      AsyncData(:final value) => GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemCount: value.length,
        itemBuilder: (context, index) => ReceiptPhotoTile(
          key: ValueKey(value[index].id),
          photo: value[index],
        ),
      ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class ReceiptPhotoTile extends ConsumerWidget {
  const ReceiptPhotoTile({super.key, required this.photo});

  final ReceiptPhoto photo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final creditorId = photo.creditorId;
    final creditorName = creditorId == null
        ? null
        : ref.watch(
            creditorProvider(creditorId).select((c) => c.value?.supplierName),
          );
    return PhotoThumbnail(
      fileName: photo.fileName,
      semanticLabel: l10n.photoSemantics(
        creditorName ?? l10n.photoNoCreditor,
        DateFormat.yMMMd(locale).format(photo.takenAt),
      ),
      onTap: () => context.push(AppRoutes.photoPath(photo.id)),
    );
  }
}
