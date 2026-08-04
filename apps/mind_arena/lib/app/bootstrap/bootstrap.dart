import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_arena/app/configuration/app_configuration.dart';
import 'package:mind_arena/app/mind_arena_app.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final configuration = AppConfiguration.fromEnvironment();

  runApp(
    ProviderScope(
      overrides: [
        appConfigurationProvider.overrideWithValue(configuration),
        arenaRepositoryProvider.overrideWithValue(
          const MarsRescueLocalRepository(),
        ),
      ],
      child: const MindArenaApp(),
    ),
  );
}
