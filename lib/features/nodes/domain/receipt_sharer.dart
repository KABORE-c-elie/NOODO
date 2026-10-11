abstract interface class ReceiptSharer {
  Future<void> share({required String text, required String subject});
}
