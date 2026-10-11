const _sequenceDigits = 4;

String formatReceiptNumber(int year, int sequence) {
  if (sequence < 1) throw RangeError.value(sequence, 'sequence');
  return 'Rec-$year-${sequence.toString().padLeft(_sequenceDigits, '0')}';
}
