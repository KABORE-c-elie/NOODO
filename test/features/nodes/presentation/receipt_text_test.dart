import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/presentation/receipt_text.dart';

const _space = ' ';

final _payment = CreditorPayment(
  id: 'p1',
  creditorId: 'awa',
  receiptNumber: 'Rec-2026-0821',
  amountFcfa: 5000,
  method: PaymentMethod.orangeMoney,
  reason: 'Avance sur livraison de piment vert',
  date: DateTime(2026, 8, 21, 10, 15),
  remainingAfterFcfa: 2500,
  creditorName: 'Maman Awa (Fournisseur Piment)',
  creditorPhone: '+226 70 00 11 22',
);

void main() {
  setUpAll(() async {
    await initializeDateFormatting('fr');
    await initializeDateFormatting('en');
  });

  test('reçu en français au format du document fonctionnel', () {
    final text = buildReceiptText(
      _payment,
      lookupAppLocalizations(const Locale('fr')),
      'fr',
    );

    expect(
      text,
      [
        'NOODO — ACCUSÉ DE PAIEMENT',
        'N° Rec-2026-0821 | Date : 21 août 2026 à 10h15',
        'Créancier / Fournisseur : Maman Awa (Fournisseur Piment)',
        'Numéro : +226 70 00 11 22',
        'Montant payé : 5${_space}000 FCFA',
        'Moyen : Mobile Money (Orange Money)',
        'Motif : Avance sur livraison de piment vert',
        'Reste à devoir : 2${_space}500 FCFA',
      ].join('\n'),
    );
  });

  test('espèces, sans téléphone ni motif : lignes omises', () {
    final text = buildReceiptText(
      _payment.copyWith(
        method: PaymentMethod.cash,
        creditorPhone: null,
        reason: null,
        remainingAfterFcfa: 0,
      ),
      lookupAppLocalizations(const Locale('fr')),
      'fr',
    );

    expect(text, contains('Moyen : Espèces'));
    expect(text, contains('Reste à devoir : 0 FCFA'));
    expect(text, isNot(contains('Numéro :')));
    expect(text, isNot(contains('Motif :')));
  });

  test('reçu en anglais', () {
    final text = buildReceiptText(
      _payment.copyWith(method: PaymentMethod.moovMoney),
      lookupAppLocalizations(const Locale('en')),
      'en',
    );

    expect(text, startsWith('NOODO — PAYMENT RECEIPT'));
    expect(
      text,
      contains('No. Rec-2026-0821 | Date: August 21, 2026 at 10:15'),
    );
    expect(text, contains('Method: Mobile Money (Moov Money)'));
    expect(text, contains('Still owed: 2,500 FCFA'));
  });
}
