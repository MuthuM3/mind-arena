import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

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

    testWidgets(
      'renders all 6 role cards and guardian relationship with step 2 of 7 header',
      (tester) async {
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

        container
            .read(arenaSessionControllerProvider.notifier)
            .enterSituation();
        await tester.pumpAndSettle();

        expect(find.text('Step 2 of 7'), findsOneWidget);
        expect(find.text('Situation Reveal'), findsOneWidget);
        expect(find.text('Reactor Engineer'), findsOneWidget);
        expect(find.text('Physician'), findsOneWidget);
        expect(find.text('Shuttle Pilot'), findsOneWidget);
        expect(find.text('Agricultural Scientist'), findsOneWidget);
        expect(find.text('Young Dependent'), findsOneWidget);
        expect(find.text('Colony Coordinator'), findsOneWidget);

        expect(find.text('Public guardian to Young Dependent'), findsOneWidget);
        expect(find.text('There is no approved correct list.'), findsWidgets);
        expect(find.text('I understand the situation'), findsOneWidget);
        expect(find.text('Leave'), findsOneWidget);
      },
    );

    testWidgets(
      'terminal action presents preview boundary feedback without offscreen tap warning',
      (tester) async {
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

        container
            .read(arenaSessionControllerProvider.notifier)
            .enterSituation();
        await tester.pumpAndSettle();

        final actionFinder = find.text('I understand the situation');
        await tester.ensureVisible(actionFinder);
        await tester.tap(actionFinder);
        await tester.pump();

        expect(actionFinder, findsOneWidget);
        expect(find.text('M1.5 Slice 01 Preview Boundary'), findsOneWidget);
      },
    );

    testWidgets('TA-02 leave action in header triggers leave path', (
      tester,
    ) async {
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

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      final leaveFinder = find.text('Leave');
      expect(leaveFinder, findsOneWidget);

      await tester.ensureVisible(leaveFinder);
      await tester.tap(leaveFinder);
      await tester.pumpAndSettle();

      // Verify controller returned to invitation state
      expect(
        container.read(arenaSessionControllerProvider),
        isA<ArenaInvitationReady>(),
      );
    });

    testWidgets(
      'toggles facts panel and preserves facts panel open state across resize',
      (tester) async {
        tester.view.physicalSize = const Size(390, 844);
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

        container
            .read(arenaSessionControllerProvider.notifier)
            .enterSituation();
        await tester.pumpAndSettle();

        // Open facts panel
        container
            .read(arenaSessionControllerProvider.notifier)
            .toggleFactsPanel();
        await tester.pumpAndSettle();

        expect(find.text('Facts and Rules'), findsOneWidget);
        expect(find.text('Shuttle Capacity'), findsOneWidget);

        // Assert state in controller
        final stateBefore =
            container.read(arenaSessionControllerProvider)
                as ArenaSituationReady;
        expect(stateBefore.isFactsPanelOpen, isTrue);

        // Resize window to expanded desktop
        tester.view.physicalSize = const Size(1440, 900);
        await tester.pumpAndSettle();

        // Assert facts panel open state preserved
        final stateAfter =
            container.read(arenaSessionControllerProvider)
                as ArenaSituationReady;
        expect(stateAfter.isFactsPanelOpen, isTrue);
        expect(find.text('Facts and Rules'), findsOneWidget);

        // Close overlay
        final closeFinder = find.text('Close');
        await tester.ensureVisible(closeFinder);
        await tester.tap(closeFinder);
        await tester.pumpAndSettle();

        expect(find.text('Facts and Rules'), findsNothing);
      },
    );
  });
}
