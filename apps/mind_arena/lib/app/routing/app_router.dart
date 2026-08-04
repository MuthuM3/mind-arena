import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_arena/arenas/todays_arena/scenes/introduction/invitation_scene.dart';
import 'package:mind_arena/arenas/todays_arena/scenes/introduction/situation_scene.dart';
import 'package:mind_arena/components/feedback/arena_state_views.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

GoRouter createAppRouter() => GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const _ArenaSessionRootScreen(),
    ),
  ],
);

class _ArenaSessionRootScreen extends ConsumerWidget {
  const _ArenaSessionRootScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(arenaSessionControllerProvider);

    return switch (sessionState) {
      ArenaSessionLoading() => const ArenaLoadingView(),
      ArenaInvitationReady(:final package) => InvitationScene(package: package),
      ArenaSituationReady(:final package, :final isFactsPanelOpen) =>
        SituationScene(package: package, isFactsPanelOpen: isFactsPanelOpen),
      ArenaPackageUnavailable(:final message) => ArenaUnavailableView(
        message: message,
        onRetry: () {
          unawaited(
            ref.read(arenaSessionControllerProvider.notifier).loadInvitation(),
          );
        },
      ),
      ArenaPackageInvalid(:final message) => ArenaInvalidView(
        message: message,
        onRetry: () {
          unawaited(
            ref.read(arenaSessionControllerProvider.notifier).loadInvitation(),
          );
        },
      ),
    };
  }
}
