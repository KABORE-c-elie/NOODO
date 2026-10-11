import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/data/drift_unit_repository.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/transaction_repository.dart';
import 'package:noodo/features/transactions/domain/unit_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_providers.g.dart';

@Riverpod(keepAlive: true)
TransactionRepository transactionRepository(Ref ref) =>
    DriftTransactionRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
UnitRepository unitRepository(Ref ref) =>
    DriftUnitRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
Future<List<LocalUnit>> units(Ref ref) =>
    ref.watch(unitRepositoryProvider).listAll();
