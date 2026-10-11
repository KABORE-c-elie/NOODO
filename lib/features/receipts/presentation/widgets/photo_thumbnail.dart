import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';

class PhotoThumbnail extends ConsumerWidget {
  const PhotoThumbnail({
    super.key,
    required this.fileName,
    required this.semanticLabel,
    required this.onTap,
  });

  final String fileName;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(photoStorageProvider).value;
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      image: true,
      label: semanticLabel,
      excludeSemantics: true,
      onTap: onTap,
      child: Material(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: storage == null
              ? const SizedBox.expand()
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final cacheWidth =
                        (constraints.maxWidth *
                                MediaQuery.devicePixelRatioOf(context))
                            .round();
                    return Image(
                      image: ResizeImage.resizeIfNeeded(
                        cacheWidth,
                        null,
                        storage.imageFor(fileName),
                      ),
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      errorBuilder: (context, _, _) => const Center(
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
