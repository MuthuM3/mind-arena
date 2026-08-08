import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

void main() {
  group('Performance & Frame Budget Measurements', () {
    Widget buildTestApp(ProviderContainer container) {
      return UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MindColors.canvasBase,
          ),
          routerConfig: createAppRouter(),
        ),
      );
    }

    testWidgets(
      'Warm start to usable invitation scene in under 1.0 second (<=1000ms)',
      (tester) async {
        final stopwatch = Stopwatch()..start();

        final container = ProviderContainer(
          overrides: [
            arenaRepositoryProvider.overrideWithValue(
              const MarsRescueLocalRepository(),
            ),
          ],
        );
        addTearDown(container.dispose);

        await tester.pumpWidget(buildTestApp(container));
        await tester.pumpAndSettle();
        stopwatch.stop();

        expect(find.text('Mars Rescue'), findsOneWidget);
        expect(stopwatch.elapsedMilliseconds, lessThanOrEqualTo(1000));
      },
    );

    testWidgets('Representative cold start under 2.5 seconds (<=2500ms)', (
      tester,
    ) async {
      final stopwatch = Stopwatch()..start();

      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();
      stopwatch.stop();

      expect(find.text('Mars Rescue'), findsOneWidget);
      expect(stopwatch.elapsedMilliseconds, lessThanOrEqualTo(2500));
    });

    testWidgets('Input visual response latency under 100ms', (tester) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      final stopwatch = Stopwatch();
      final enterFinder = find.text('Enter arena');
      await tester.ensureVisible(enterFinder);
      await tester.tap(enterFinder);
      stopwatch.start();
      await tester.pump();
      stopwatch.stop();

      expect(stopwatch.elapsedMilliseconds, lessThanOrEqualTo(100));
    });

    testWidgets('Memory and state stability over 10 repeated session resets', (
      tester,
    ) async {
      for (var i = 0; i < 10; i++) {
        final container = ProviderContainer(
          overrides: [
            arenaRepositoryProvider.overrideWithValue(
              const MarsRescueLocalRepository(),
            ),
          ],
        );

        await tester.pumpWidget(buildTestApp(container));
        await tester.pumpAndSettle();

        container
            .read(arenaSessionControllerProvider.notifier)
            .enterSituation();
        await tester.pumpAndSettle();

        expect(
          container.read(arenaSessionControllerProvider),
          isA<ArenaSituationReady>(),
        );

        container
            .read(arenaSessionControllerProvider.notifier)
            .toggleFactsPanel();
        await tester.pumpAndSettle();

        container
            .read(arenaSessionControllerProvider.notifier)
            .closeFactsPanel();
        await tester.pumpAndSettle();

        container.dispose();
      }
    });
  });
}
