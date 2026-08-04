import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/domain/repository_contracts/arena_repository.dart';
import 'package:mind_arena/experience/orchestration/arena_session_controller.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

void main() {
  group('ArenaSessionController', () {
    test('initializes and transitions to ArenaInvitationReady', () async {
      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      container.read(arenaSessionControllerProvider);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(arenaSessionControllerProvider);
      expect(state, isA<ArenaInvitationReady>());
    });

    test(
      'transitions from invitation to situation on enterSituation',
      () async {
        final container = ProviderContainer(
          overrides: [
            arenaRepositoryProvider.overrideWithValue(
              const MarsRescueLocalRepository(),
            ),
          ],
        );
        addTearDown(container.dispose);

        container.read(arenaSessionControllerProvider);
        await Future<void>.delayed(Duration.zero);

        final controller = container.read(
          arenaSessionControllerProvider.notifier,
        );
        controller.enterSituation();

        final state = container.read(arenaSessionControllerProvider);
        expect(state, isA<ArenaSituationReady>());
      },
    );

    test('toggles and closes facts panel in situation state', () async {
      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      container.read(arenaSessionControllerProvider);
      await Future<void>.delayed(Duration.zero);

      final controller = container.read(
        arenaSessionControllerProvider.notifier,
      );
      controller.enterSituation();

      final stateBefore =
          container.read(arenaSessionControllerProvider) as ArenaSituationReady;
      expect(stateBefore.isFactsPanelOpen, isFalse);

      controller.toggleFactsPanel();
      final stateAfterToggle =
          container.read(arenaSessionControllerProvider) as ArenaSituationReady;
      expect(stateAfterToggle.isFactsPanelOpen, isTrue);

      controller.closeFactsPanel();
      final stateAfterClose =
          container.read(arenaSessionControllerProvider) as ArenaSituationReady;
      expect(stateAfterClose.isFactsPanelOpen, isFalse);
    });

    test('handles malformed test mode gracefully', () async {
      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      container
          .read(arenaTestModeProvider.notifier)
          .setMode(ArenaTestMode.malformed);
      container.read(arenaSessionControllerProvider);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(arenaSessionControllerProvider);
      expect(state, isA<ArenaPackageInvalid>());
    });

    test('handles unavailable test mode gracefully', () async {
      final container = ProviderContainer(
        overrides: [
          arenaRepositoryProvider.overrideWithValue(
            const MarsRescueLocalRepository(),
          ),
        ],
      );
      addTearDown(container.dispose);

      container
          .read(arenaTestModeProvider.notifier)
          .setMode(ArenaTestMode.unavailable);
      container.read(arenaSessionControllerProvider);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(arenaSessionControllerProvider);
      expect(state, isA<ArenaPackageUnavailable>());
    });
  });
}
