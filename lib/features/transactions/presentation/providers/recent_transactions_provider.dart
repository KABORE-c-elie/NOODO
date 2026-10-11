import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_transactions_provider.g.dart';

const recentTransactionsLimit = 10;

@riverpod
Stream<List<Transaction>> recentTransactions(Ref ref) => ref
    .watch(transactionRepositoryProvider)
    .watchLatest(recentTransactionsLimit);
