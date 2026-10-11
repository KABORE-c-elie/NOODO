import 'dart:math';

import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:uuid/uuid.dart';

const _products = {
  TransactionCategory.vegetables: ['tomates', 'oignons', 'piment', 'gombo'],
  TransactionCategory.cereals: ['riz', 'maïs', 'mil'],
  TransactionCategory.transport: ['taxi', 'moto', 'essence'],
  TransactionCategory.supplies: ['sachets', 'savon', 'bassine'],
  TransactionCategory.other: ['divers'],
};

final class DemoDataSeeder {
  const DemoDataSeeder(this._db);

  static const _uuid = Uuid();
  static const spanDays = 120;

  final AppDatabase _db;

  Future<int> seed({required int count, required DateTime now, int seed = 7}) {
    final random = Random(seed);
    final rows = [for (var i = 0; i < count; i++) _row(random, now)];
    return _db
        .batch((b) => b.insertAll(_db.transactions, rows))
        .then((_) => rows.length);
  }

  TransactionsCompanion _row(Random random, DateTime now) {
    const categories = TransactionCategory.values;
    final category = categories[random.nextInt(categories.length)];
    final isSale =
        category != TransactionCategory.transport && random.nextInt(3) > 0;
    final names = _products[category]!;
    final product = names[random.nextInt(names.length)];
    final amount = (random.nextInt(60) + 1) * 250;
    return TransactionsCompanion.insert(
      id: 'demo-${_uuid.v4()}',
      type: isSale ? TransactionType.sale : TransactionType.expense,
      amountFcfa: amount,
      product: Value(product),
      category: Value(category),
      rawText: '${isSale ? 'vendu' : 'payé'} $product $amount F',
      date: now.subtract(Duration(minutes: random.nextInt(spanDays * 24 * 60))),
    );
  }
}
