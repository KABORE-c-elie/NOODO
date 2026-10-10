import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/node_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'node_providers.g.dart';

@Riverpod(keepAlive: true)
NodeRepository nodeRepository(Ref ref) =>
    DriftNodeRepository(ref.watch(appDatabaseProvider));
