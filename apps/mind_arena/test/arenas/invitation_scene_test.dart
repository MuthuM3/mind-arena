import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/arenas/todays_arena/scenes/introduction/invitation_scene.dart';
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
          home: FutureBuilder(
            future: repository.loadMarsRescuePackage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              return InvitationScene(package: snapshot.data!);
            },
          ),
        ),
      );
    }

    testWidgets('renders TA-01 content without prohibited claims', (
      tester,
    ) async {
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

      // Verify prohibited claims are NOT present
      expect(find.textContaining('player'), findsNothing);
      expect(find.textContaining('percentile'), findsNothing);
      expect(find.textContaining('streak'), findsNothing);
      expect(find.textContaining('countdown'), findsNothing);
      expect(find.textContaining('GPT'), findsNothing);
      expect(find.textContaining('Gemini'), findsNothing);
    });

    testWidgets('renders across compact viewport size', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Enter arena'), findsOneWidget);
    });

    testWidgets('renders across expanded viewport size', (tester) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('How Today’s Arena Works'), findsOneWidget);
      expect(find.text('Enter arena'), findsOneWidget);
    });
  });
}
