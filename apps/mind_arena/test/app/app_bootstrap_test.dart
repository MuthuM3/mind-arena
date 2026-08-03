import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/configuration/app_configuration.dart';
import 'package:mind_arena/app/mind_arena_app.dart';

void main() {
  testWidgets('boots the empty application shell', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigurationProvider.overrideWithValue(
            const AppConfiguration(environment: AppEnvironment.development),
          ),
        ],
        child: const MindArenaApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MindArenaApp), findsOneWidget);
    expect(find.byType(Text), findsNothing);
  });
}
