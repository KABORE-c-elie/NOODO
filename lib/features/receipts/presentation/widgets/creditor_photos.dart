import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:noodo/features/receipts/presentation/screens/receipts_screen.dart';
import 'package:noodo/features/receipts/presentation/widgets/attach_photo_sheet.dart';

const _thumbnailSize = 88.0;

class CreditorPhotos extends ConsumerWidget {
  const CreditorPhotos({super.key, required this.creditorId});

  final String creditorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final photos =
        ref.watch(photosProvider(PhotoQuery(creditorId: creditorId))).value ??
        const <ReceiptPhoto>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.photosTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
              tooltip: l10n.takePhotoForCreditorTooltip,
              icon: const Icon(Icons.add_a_photo_outlined),
              onPressed: () =>
                  takeAndAttachPhoto(context, ref, creditorId: creditorId),
            ),
          ],
        ),
        if (photos.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(l10n.noPhotos),
          )
        else
          SizedBox(
            height: _thumbnailSize,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) => SizedBox.square(
                dimension: _thumbnailSize,
                child: ReceiptPhotoTile(
                  key: ValueKey(photos[index].id),
                  photo: photos[index],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
