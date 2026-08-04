import 'package:mind_arena/domain/models/arena_package.dart';

/// Test modes supported by local test repositories to simulate package loading states.
enum ArenaTestMode { normal, unavailable, malformed }

/// Abstract contract for arena package repositories.
abstract interface class ArenaRepository {
  /// Loads the Mars Rescue package.
  /// Throws [PackageValidationException] if malformed or invalid.
  /// Throws [StateError] or returns null / throws if unavailable depending on [mode].
  Future<MarsRescuePackage> loadMarsRescuePackage({
    ArenaTestMode mode = ArenaTestMode.normal,
  });
}
