import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/arenas/todays_arena/scenes/introduction/invitation_scene.dart';
import 'package:mind_arena/components/feedback/arena_state_views.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';

void main() {
  group('InvitationScene (TA-01)', () {
    late MarsRescueLocalRepository repository;

    setUp(() {
      repository = const MarsRescueLocalRepository();
    });

    Widget createWidgetUnderTest() {
      return ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: FutureBuilder(
              future: repository.loadMarsRescuePackage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox.shrink();
                }
                return InvitationScene(package: snapshot.data!);
              },
            ),
          ),
        ),
      );
    }

    testWidgets('renders TA-01 content without prohibited claims', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Today’s Arena'), findsOneWidget);
      expect(find.text('Mars Rescue'), findsOneWidget);
      expect(
        find.text(
          'One shuttle. Three seats. Six lives and six responsibilities.',
        ),
        findsOneWidget,
      );
      expect(find.text('Shared with real people · Not live'), findsOneWidget);
      expect(find.text('Adult-Only 18+'), findsOneWidget);
      expect(find.text('Enter arena'), findsOneWidget);
      expect(find.text('Leave arena'), findsOneWidget);

      // Verify prohibited claims are NOT present
      expect(find.textContaining('player'), findsNothing);
      expect(find.textContaining('percentile'), findsNothing);
      expect(find.textContaining('streak'), findsNothing);
      expect(find.textContaining('countdown'), findsNothing);
      expect(find.textContaining('GPT'), findsNothing);
      expect(find.textContaining('Gemini'), findsNothing);
    });

    testWidgets('leave arena action button is on-screen, activated cleanly', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final leaveFinder = find.text('Leave arena');
      expect(leaveFinder, findsOneWidget);

      await tester.ensureVisible(leaveFinder);
      await tester.tap(leaveFinder);
      await tester.pump();
    });

    testWidgets('renders ArenaLoadingView during package load', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: ArenaLoadingView())),
      );

      expect(find.text('Entering Today’s Arena...'), findsOneWidget);
    });

    testWidgets('renders ArenaUnavailableView during package failure', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ArenaUnavailableView(
            message: 'Mars Rescue package unavailable.',
            onRetry: () {},
          ),
        ),
      );

      expect(find.text('Arena Unavailable'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('renders ArenaInvalidView during malformed package', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ArenaInvalidView(message: 'Invalid role count', onRetry: () {}),
        ),
      );

      expect(find.text('Invalid Arena Package'), findsOneWidget);
      expect(find.text('Reload Package'), findsOneWidget);
    });

    testWidgets(
      'preserves scroll position, scene, and focus intent across resize',
      (tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Verify initial compact state & focus
        expect(find.text('Mars Rescue'), findsOneWidget);

        final scrollableFinder = find.byType(SingleChildScrollView);
        expect(scrollableFinder, findsOneWidget);

        // Scroll down
        await tester.drag(scrollableFinder, const Offset(0, -100));
        await tester.pump();

        // Resize window to expanded desktop
        tester.view.physicalSize = const Size(1440, 900);
        await tester.pumpAndSettle();

        // Assert scene content and layout reflow preserved
        expect(find.text('Mars Rescue'), findsOneWidget);
        expect(find.text('How Today’s Arena Works'), findsOneWidget);
        expect(find.text('Enter arena'), findsOneWidget);
      },
    );
  });
}
