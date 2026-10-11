import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/nodes/domain/receipt_number.dart';

void main() {
  test('format Rec-AAAA-NNNN sur quatre chiffres', () {
    expect(formatReceiptNumber(2026, 1), 'Rec-2026-0001');
    expect(formatReceiptNumber(2026, 821), 'Rec-2026-0821');
    expect(formatReceiptNumber(2027, 9999), 'Rec-2027-9999');
  });

  test('au-delà de 9 999 le numéro s\'allonge sans être tronqué', () {
    expect(formatReceiptNumber(2026, 12345), 'Rec-2026-12345');
  });

  test('séquence invalide refusée', () {
    expect(() => formatReceiptNumber(2026, 0), throwsRangeError);
  });
}
