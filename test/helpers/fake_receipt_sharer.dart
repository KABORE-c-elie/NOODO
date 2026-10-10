import 'package:noodo/features/nodes/domain/receipt_sharer.dart';

class FakeReceiptSharer implements ReceiptSharer {
  final shared = <({String text, String subject})>[];

  @override
  Future<void> share({required String text, required String subject}) async {
    shared.add((text: text, subject: subject));
  }
}
