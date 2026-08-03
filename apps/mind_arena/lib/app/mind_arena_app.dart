import 'package:flutter/material.dart';
import 'package:mind_arena/app/routing/app_router.dart';

final _router = createAppRouter();

final class MindArenaApp extends StatelessWidget {
  const MindArenaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Mind Arena',
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
  );
}
