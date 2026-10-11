import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:noodo/features/receipts/presentation/photo_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_viewer_screen.g.dart';

@riverpod
Future<ReceiptPhoto?> photoById(Ref ref, String id) =>
    ref.watch(photoRepositoryProvider).findById(id);

class PhotoViewerScreen extends ConsumerWidget {
  const PhotoViewerScreen({super.key, required this.photoId});

  final String photoId;

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    ReceiptPhoto photo,
  ) async {
    final l10n = AppLocalizations.of(context);
    final navigator = Navigator.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deletePhotoTitle),
        content: Text(l10n.deletePhotoBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(photoActionsProvider).delete(photo);
    navigator.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final photo = ref.watch(photoByIdProvider(photoId)).value;
    final storage = ref.watch(photoStorageProvider).value;
    final creditorId = photo?.creditorId;
    final creditorName = creditorId == null
        ? null
        : ref.watch(
            creditorProvider(creditorId).select((c) => c.value?.supplierName),
          );
    return Scaffold(
      appBar: AppBar(
        title: Text(creditorName ?? l10n.receiptsTitle),
        actions: [
          if (photo != null)
            IconButton(
              tooltip: l10n.deletePhotoTooltip,
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _delete(context, ref, photo),
            ),
        ],
      ),
      body: photo == null || storage == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: InteractiveViewer(
                    child: Center(
                      child: Image(
                        image: storage.imageFor(photo.fileName),
                        semanticLabel: l10n.photoSemantics(
                          creditorName ?? l10n.photoNoCreditor,
                          DateFormat.yMMMd(locale).format(photo.takenAt),
                        ),
                        errorBuilder: (context, _, _) =>
                            const Icon(Icons.broken_image_outlined, size: 64),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    DateFormat.yMMMMEEEEd(locale)
                        .add_Hm()
                        .format(photo.takenAt),
                  ),
                ),
              ],
            ),
    );
  }
}
