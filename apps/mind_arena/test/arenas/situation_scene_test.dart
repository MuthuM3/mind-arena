import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

void main() {
  group('SituationScene (TA-02)', () {
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

    testWidgets('renders all 6 role cards and guardian relationship', (
      tester,
    ) async {
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

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      expect(find.text('Reactor Engineer'), findsOneWidget);
      expect(find.text('Physician'), findsOneWidget);
      expect(find.text('Shuttle Pilot'), findsOneWidget);
      expect(find.text('Agricultural Scientist'), findsOneWidget);
      expect(find.text('Young Dependent'), findsOneWidget);
      expect(find.text('Colony Coordinator'), findsOneWidget);

      expect(find.text('Public guardian to Young Dependent'), findsOneWidget);
      expect(find.text('There is no approved correct list.'), findsWidgets);
      expect(find.text('I understand the situation'), findsOneWidget);
    });

    testWidgets('toggles and closes facts panel overlay', (tester) async {
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

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      container
          .read(arenaSessionControllerProvider.notifier)
          .toggleFactsPanel();
      await tester.pumpAndSettle();

      expect(find.text('Facts and Rules'), findsOneWidget);
      expect(find.text('Shuttle Capacity'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      // Assert facts panel is no longer visible
      expect(find.text('Facts and Rules'), findsNothing);
    });
  });
}
