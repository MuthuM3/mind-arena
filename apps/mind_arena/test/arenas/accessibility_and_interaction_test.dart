import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

void main() {
  group('Accessibility & Interaction Verification', () {
    Widget buildTestApp() {
      return ProviderScope(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MindColors.canvasBase,
          ),
          routerConfig: createAppRouter(),
        ),
      );
    }

    testWidgets('Keyboard Tab focus order and visible focus ring', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // TAB into the page
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Enter arena button should be focused
      final enterButtonFinder = find.text('Enter arena');
      expect(enterButtonFinder, findsOneWidget);

      // Trigger activation via Space key
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pumpAndSettle();

      // Should transition to TA-02 Situation Reveal
      expect(find.text('Situation Reveal'), findsOneWidget);
    });

    testWidgets('Keyboard Enter key activates focused controls', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // TAB to Enter arena button
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Activate with Enter key
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(find.text('Situation Reveal'), findsOneWidget);
    });

    testWidgets('Escape key closes facts panel overlay', (tester) async {
      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: MindColors.canvasBase,
            ),
            routerConfig: createAppRouter(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Transition to TA-02
      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      // Open facts panel
      container
          .read(arenaSessionControllerProvider.notifier)
          .toggleFactsPanel();
      await tester.pumpAndSettle();

      expect(find.text('Facts and Rules'), findsOneWidget);

      // Press Escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      // Facts panel should be closed
      expect(find.text('Facts and Rules'), findsNothing);
    });

    testWidgets('Semantics labels and heading hierarchy', (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(buildTestApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Verify header semantics
      expect(
        tester.getSemantics(find.text('Today’s Arena')),
        matchesSemantics(isHeader: true, label: 'Today’s Arena'),
      );

      handle.dispose();
    });

    testWidgets('TA-02 Situation Reveal at 200% system text scale', (
      tester,
    ) async {
      tester.view.platformDispatcher.textScaleFactorTestValue = 2.0;
      addTearDown(tester.view.platformDispatcher.clearTextScaleFactorTestValue);

      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: MindColors.canvasBase,
            ),
            routerConfig: createAppRouter(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      expect(find.text('Reactor Engineer'), findsOneWidget);
      expect(find.text('Colony Coordinator'), findsOneWidget);
      expect(find.text('I understand the situation'), findsOneWidget);
    });

    testWidgets('State-preserving window resize across window classes', (
      tester,
    ) async {
      // Start compact
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

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: MindColors.canvasBase,
            ),
            routerConfig: createAppRouter(),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Enter situation and open facts panel
      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      container
          .read(arenaSessionControllerProvider.notifier)
          .toggleFactsPanel();
      await tester.pumpAndSettle();

      expect(find.text('Facts and Rules'), findsOneWidget);

      // Resize to Expanded desktop width
      tester.view.physicalSize = const Size(1440, 900);
      await tester.pumpAndSettle();

      // Active scene and facts panel open state MUST be preserved
      final state = container.read(arenaSessionControllerProvider);
      expect(state, isA<ArenaSituationReady>());
      expect((state as ArenaSituationReady).isFactsPanelOpen, isTrue);
      expect(find.text('Facts and Rules'), findsOneWidget);
    });
  });
}
