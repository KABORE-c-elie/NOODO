import 'package:go_router/go_router.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/router/app_shell.dart';
import 'package:noodo/features/nodes/presentation/screens/creditor_screen.dart';
import 'package:noodo/features/nodes/presentation/screens/nodes_screen.dart';
import 'package:noodo/features/profits/presentation/screens/profits_screen.dart';
import 'package:noodo/features/receipts/presentation/screens/receipts_screen.dart';
import 'package:noodo/features/settings/presentation/screens/settings_screen.dart';
import 'package:noodo/features/transactions/presentation/screens/confirmation_screen.dart';
import 'package:noodo/features/transactions/presentation/screens/history_screen.dart';
import 'package:noodo/features/transactions/presentation/screens/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.history,
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profits,
                builder: (context, state) => const ProfitsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.nodes,
                builder: (context, state) => const NodesScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutes.creditor,
                    builder: (context, state) => CreditorScreen(
                      creditorId:
                          state.pathParameters[AppRoutes.creditorIdParameter]!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.confirmation,
        builder: (context, state) => ConfirmationScreen(
          initialTranscript:
              state.uri.queryParameters[AppRoutes.transcriptParameter],
        ),
      ),
      GoRoute(
        path: AppRoutes.receipts,
        builder: (context, state) => const ReceiptsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
