import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/configuration/app_configuration.dart';
import 'package:mind_arena/app/mind_arena_app.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

void main() {
  testWidgets('boots the application shell with Mars Rescue invitation', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigurationProvider.overrideWithValue(
            const AppConfiguration(environment: AppEnvironment.development),
          ),
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
        child: const MindArenaApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MindArenaApp), findsOneWidget);
    expect(find.text('Mars Rescue'), findsOneWidget);
  });
}
