import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/presentation/widgets/add_creditor_sheet.dart';
import 'package:noodo/features/nodes/presentation/widgets/creditor_tile.dart';
import 'package:noodo/features/nodes/presentation/widgets/tax_node_card.dart';

class NodesScreen extends StatelessWidget {
  const NodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.nodesTitle)),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: l10n.addCreditorTooltip,
        icon: const Icon(Icons.person_add_alt_1),
        label: Text(l10n.addCreditor),
        onPressed: () => showAddCreditorSheet(context),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            sliver: SliverToBoxAdapter(child: TaxNodeCard()),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: Text(
                l10n.creditorsTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const _CreditorsSliver(),
          const SliverToBoxAdapter(child: SizedBox(height: 96)),
        ],
      ),
    );
  }
}

class _CreditorsSliver extends ConsumerWidget {
  const _CreditorsSliver();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final creditors = ref.watch(creditorsProvider);
    return switch (creditors) {
      AsyncData(:final value) when value.isEmpty => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Text(l10n.noCreditors, textAlign: TextAlign.center),
        ),
      ),
      AsyncData(:final value) => SliverList.builder(
        itemCount: value.length,
        itemBuilder: (context, index) => CreditorTile(
          key: ValueKey(value[index].id),
          creditor: value[index],
        ),
      ),
      _ => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
    };
  }
}
