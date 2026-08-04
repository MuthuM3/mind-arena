import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_arena/domain/models/arena_package_exceptions.dart';
import 'package:mind_arena/domain/repository_contracts/arena_repository.dart';
import 'package:mind_arena/experience/state/arena_session_state.dart';

/// Abstract provider for the ArenaRepository instance.
/// Overridden at the root / bootstrap boundary.
final arenaRepositoryProvider = Provider<ArenaRepository>((ref) {
  throw UnimplementedError(
    'arenaRepositoryProvider must be overridden at the root / bootstrap boundary.',
  );
});

/// Provider for the current test mode (defaults to normal).
final arenaTestModeProvider =
    NotifierProvider<ArenaTestModeNotifier, ArenaTestMode>(
      ArenaTestModeNotifier.new,
    );

class ArenaTestModeNotifier extends Notifier<ArenaTestMode> {
  @override
  ArenaTestMode build() => ArenaTestMode.normal;

  void setMode(ArenaTestMode mode) => state = mode;
}

/// Controller for managing active arena session state transitions.
final arenaSessionControllerProvider =
    NotifierProvider<ArenaSessionController, ArenaSessionState>(
      ArenaSessionController.new,
    );

class ArenaSessionController extends Notifier<ArenaSessionState> {
  int _activeRequestId = 0;

  @override
  ArenaSessionState build() {
    final testMode = ref.watch(arenaTestModeProvider);
    unawaited(loadInvitation(mode: testMode));
    return const ArenaSessionLoading();
  }

  /// Loads the arena package and sets invitation state.
  /// Ignores responses from stale / superseded requests.
  Future<void> loadInvitation({
    ArenaTestMode mode = ArenaTestMode.normal,
  }) async {
    final requestId = ++_activeRequestId;
    state = const ArenaSessionLoading();
    final repository = ref.read(arenaRepositoryProvider);

    try {
      final package = await repository.loadMarsRescuePackage(mode: mode);
      if (requestId == _activeRequestId) {
        state = ArenaInvitationReady(package);
      }
    } on PackageValidationException catch (e) {
      if (requestId == _activeRequestId) {
        state = ArenaPackageInvalid(e.message);
      }
    } catch (e) {
      if (requestId == _activeRequestId) {
        state = ArenaPackageUnavailable(e.toString());
      }
    }
  }

  /// Transition from TA-01 Invitation to TA-02 Situation.
  void enterSituation() {
    final currentState = state;
    if (currentState is ArenaInvitationReady) {
      state = ArenaSituationReady(package: currentState.package);
    }
  }

  /// Toggle facts panel overlay open/close on TA-02.
  void toggleFactsPanel() {
    final currentState = state;
    if (currentState is ArenaSituationReady) {
      state = currentState.copyWith(
        isFactsPanelOpen: !currentState.isFactsPanelOpen,
      );
    }
  }

  /// Explicitly close facts overlay (e.g. via Escape key or close button).
  void closeFactsPanel() {
    final currentState = state;
    if (currentState is ArenaSituationReady && currentState.isFactsPanelOpen) {
      state = currentState.copyWith(isFactsPanelOpen: false);
    }
  }
}
