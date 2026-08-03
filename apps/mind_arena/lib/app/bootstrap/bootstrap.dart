import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_arena/app/configuration/app_configuration.dart';
import 'package:mind_arena/app/mind_arena_app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final configuration = AppConfiguration.fromEnvironment();

  runApp(
    ProviderScope(
      overrides: [appConfigurationProvider.overrideWithValue(configuration)],
      child: const MindArenaApp(),
    ),
  );
}
