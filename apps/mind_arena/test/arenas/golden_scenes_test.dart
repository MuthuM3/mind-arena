import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

void main() {
  group('Golden Viewport Compositions & Visual Verification', () {
    Widget buildTestApp(
      ProviderContainer container, {
      bool reduceMotion = false,
    }) {
      return UncontrolledProviderScope(
        container: container,
        child: MediaQuery(
          data: MediaQueryData(
            accessibleNavigation: false,
            boldText: false,
            disableAnimations: reduceMotion,
          ),
          child: MaterialApp.router(
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: MindColors.canvasBase,
            ),
            routerConfig: createAppRouter(),
          ),
        ),
      );
    }

    ProviderContainer createContainer() {
      return ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
    }

    testWidgets('TA-01 390x844 Compact Portrait Golden', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      expect(find.text('Mars Rescue'), findsOneWidget);
      expect(find.text('Enter arena'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_compact_portrait.png'),
      );
    });

    testWidgets('TA-01 844x390 Compact Landscape Golden', (tester) async {
      tester.view.physicalSize = const Size(844, 390);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      expect(find.text('Mars Rescue'), findsOneWidget);
      expect(find.text('Enter arena'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_compact_landscape.png'),
      );
    });

    testWidgets('TA-01 768x1024 Medium Tablet Golden', (tester) async {
      tester.view.physicalSize = const Size(768, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      expect(find.text('How Today’s Arena Works'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_medium_tablet.png'),
      );
    });

    testWidgets('TA-01 1024x768 Expanded Boundary Golden', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      expect(find.text('How Today’s Arena Works'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_expanded_tablet.png'),
      );
    });

    testWidgets('TA-01 1440x900 Expanded Desktop Golden', (tester) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      expect(find.text('How Today’s Arena Works'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_expanded_desktop.png'),
      );
    });

    testWidgets('TA-02 390x844 Situation Reveal Compact Golden', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      expect(find.text('Reactor Engineer'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta02_compact_portrait.png'),
      );
    });

    testWidgets('TA-02 1440x900 Situation Reveal Expanded Golden', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      expect(find.text('Reactor Engineer'), findsOneWidget);
      expect(find.text('Colony Coordinator'), findsOneWidget);
      expect(find.text('I understand the situation'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta02_expanded_desktop.png'),
      );
    });

    testWidgets('TA-02 Facts Panel Overlay Golden', (tester) async {
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final container = createContainer();
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
    });

    testWidgets('200% system text scale layout golden check', (tester) async {
      tester.view.platformDispatcher.textScaleFactorTestValue = 2.0;
      addTearDown(tester.view.platformDispatcher.clearTextScaleFactorTestValue);

      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container));
      await tester.pumpAndSettle();

      container.read(arenaSessionControllerProvider.notifier).enterSituation();
      await tester.pumpAndSettle();

      expect(find.text('Reactor Engineer'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_text_scale_200.png'),
      );
    });

    testWidgets('reduced motion setting layout golden check', (tester) async {
      final container = createContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(buildTestApp(container, reduceMotion: true));
      await tester.pumpAndSettle();

      expect(find.text('Mars Rescue'), findsOneWidget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/ta01_reduced_motion.png'),
      );
    });
  });
}
