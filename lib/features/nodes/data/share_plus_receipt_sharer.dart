import 'package:noodo/features/nodes/domain/receipt_sharer.dart';
import 'package:share_plus/share_plus.dart';

final class SharePlusReceiptSharer implements ReceiptSharer {
  const SharePlusReceiptSharer();

  @override
  Future<void> share({required String text, required String subject}) =>
      SharePlus.instance.share(ShareParams(text: text, subject: subject));
}
