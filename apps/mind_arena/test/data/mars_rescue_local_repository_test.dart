import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/domain/models/arena_package_exceptions.dart';
import 'package:mind_arena/domain/repository_contracts/arena_repository.dart';

void main() {
  group('MarsRescueLocalRepository', () {
    late MarsRescueLocalRepository repository;

    setUp(() {
      repository = const MarsRescueLocalRepository();
    });

    test('loads valid normal Mars Rescue package', () async {
      final package = await repository.loadMarsRescuePackage(
        mode: ArenaTestMode.normal,
      );

      expect(package.id, equals('mars_rescue'));
      expect(package.contentVersion, equals('M1.1.0'));
      expect(package.roles.length, equals(6));
      expect(package.facts.length, equals(5));
      expect(package.constraint.capacity, equals(3));
      expect(package.constraint.totalRoles, equals(6));

      final coordinator = package.roles.firstWhere(
        (r) => r.id == 'colony_coordinator',
      );
      expect(coordinator.guardianToRoleId, equals('young_dependent'));
    });

    test('throws exception when mode is unavailable', () async {
      expect(
        () => repository.loadMarsRescuePackage(mode: ArenaTestMode.unavailable),
        throwsA(isA<Exception>()),
      );
    });

    test('throws PackageValidationException when mode is malformed', () async {
      expect(
        () => repository.loadMarsRescuePackage(mode: ArenaTestMode.malformed),
        throwsA(isA<PackageValidationException>()),
      );
    });
  });
}
