import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/core/utils/current_day_provider.dart';

void main() {
  test('passe au jour suivant à minuit', () {
    fakeAsync((async) {
      final start = DateTime(2026, 10, 14, 23, 59, 30);
      final container = ProviderContainer.test(
        overrides: [
          clockProvider.overrideWithValue(() => start.add(async.elapsed)),
        ],
      );
      final days = <DateTime>[];
      container.listen(
        currentDayProvider,
        (_, day) => days.add(day),
        fireImmediately: true,
      );

      async.elapse(const Duration(seconds: 29));
      expect(days, [DateTime(2026, 10, 14)]);

      async.elapse(const Duration(seconds: 1));
      expect(days, [DateTime(2026, 10, 14), DateTime(2026, 10, 15)]);

      container.dispose();
    });
  });

  test(
    'refresh au retour au premier plan ne notifie que si le jour change',
    () {
      var now = DateTime(2026, 10, 14, 10);
      final container = ProviderContainer.test(
        overrides: [clockProvider.overrideWithValue(() => now)],
      );
      final days = <DateTime>[];
      container.listen(currentDayProvider, (_, day) => days.add(day));

      now = DateTime(2026, 10, 14, 18);
      container.read(currentDayProvider.notifier).refresh();
      expect(days, isEmpty);

      now = DateTime(2026, 10, 16, 8);
      container.read(currentDayProvider.notifier).refresh();
      expect(days, [DateTime(2026, 10, 16)]);
    },
  );
}
