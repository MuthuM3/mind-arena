import 'package:flutter/foundation.dart';
import 'package:mind_arena/domain/models/arena_package.dart';

/// Identifies the active scene in Today's Arena.
enum SceneId { invitation, situation }

/// Sealed hierarchy representing the active state of an arena session.
@immutable
sealed class ArenaSessionState {
  const ArenaSessionState();
}

/// Session is loading the arena package.
final class ArenaSessionLoading extends ArenaSessionState {
  const ArenaSessionLoading();
}

/// Session is on Scene TA-01 (Invitation).
final class ArenaInvitationReady extends ArenaSessionState {
  const ArenaInvitationReady(this.package);

  final MarsRescuePackage package;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaInvitationReady &&
          runtimeType == other.runtimeType &&
          package == other.package;

  @override
  int get hashCode => package.hashCode;
}

/// Session is on Scene TA-02 (Situation).
final class ArenaSituationReady extends ArenaSessionState {
  const ArenaSituationReady({
    required this.package,
    this.isFactsPanelOpen = false,
  });

  final MarsRescuePackage package;
  final bool isFactsPanelOpen;

  ArenaSituationReady copyWith({
    MarsRescuePackage? package,
    bool? isFactsPanelOpen,
  }) {
    return ArenaSituationReady(
      package: package ?? this.package,
      isFactsPanelOpen: isFactsPanelOpen ?? this.isFactsPanelOpen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaSituationReady &&
          runtimeType == other.runtimeType &&
          package == other.package &&
          isFactsPanelOpen == other.isFactsPanelOpen;

  @override
  int get hashCode => Object.hash(package, isFactsPanelOpen);
}

/// Session failed because the package is unavailable.
final class ArenaPackageUnavailable extends ArenaSessionState {
  const ArenaPackageUnavailable(this.message);

  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaPackageUnavailable &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

/// Session failed because the package is malformed or invalid.
final class ArenaPackageInvalid extends ArenaSessionState {
  const ArenaPackageInvalid(this.message);

  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaPackageInvalid &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
