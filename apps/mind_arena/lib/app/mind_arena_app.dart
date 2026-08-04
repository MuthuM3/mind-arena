import 'package:flutter/material.dart';
import 'package:mind_arena/app/routing/app_router.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';

final _router = createAppRouter();

final class MindArenaApp extends StatelessWidget {
  const MindArenaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Mind Arena',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: MindColors.canvasBase,
      canvasColor: MindColors.canvasBase,
    ),
    routerConfig: _router,
  );
}
