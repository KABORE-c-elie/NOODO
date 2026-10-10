import 'package:drift/native.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

AppDatabase createMemoryDatabase() => AppDatabase(NativeDatabase.memory());

const tasUnit = LocalUnit(id: 'tas', name: 'tas');

Transaction sale(
  String id,
  int amountFcfa,
  DateTime date, {
  TransactionCategory category = TransactionCategory.other,
  LocalUnit? unit,
}) => Transaction(
  id: id,
  type: TransactionType.sale,
  amountFcfa: amountFcfa,
  unit: unit,
  category: category,
  rawText: 'vente $id',
  date: date,
);

Transaction expense(
  String id,
  int amountFcfa,
  DateTime date, {
  TransactionCategory category = TransactionCategory.other,
}) => Transaction(
  id: id,
  type: TransactionType.expense,
  amountFcfa: amountFcfa,
  category: category,
  rawText: 'dépense $id',
  date: date,
);
