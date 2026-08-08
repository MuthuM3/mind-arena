import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/data/local/mars_rescue_local_repository.dart';
import 'package:mind_arena/domain/models/arena_package.dart';
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
      expect(package.locale, equals('en-US'));
      expect(
        package.socialTruthLabel,
        equals('Shared with real people · Not live'),
      );
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

    test('validates package: throws on duplicate role ID', () {
      final badPackage = MarsRescuePackage(
        id: 'mars_rescue',
        contentVersion: 'M1.1.0',
        locale: 'en-US',
        title: 'Mars Rescue',
        premise: 'Premise',
        stakesLine: 'Stakes',
        socialTruthLabel: 'Truth',
        audienceClassification: 'Adult 18+',
        estimatedMinutes: 3,
        roles: const [
          ArenaRole(id: 'r1', title: 'Role 1', description: 'Desc 1'),
          ArenaRole(
            id: 'r1',
            title: 'Role 2',
            description: 'Desc 2',
          ), // Duplicate
          ArenaRole(id: 'r3', title: 'Role 3', description: 'Desc 3'),
          ArenaRole(id: 'r4', title: 'Role 4', description: 'Desc 4'),
          ArenaRole(id: 'r5', title: 'Role 5', description: 'Desc 5'),
          ArenaRole(id: 'r6', title: 'Role 6', description: 'Desc 6'),
        ],
        facts: const [ArenaFact(title: 'F1', detail: 'Detail')],
        constraint: const ArenaConstraint(capacity: 3, totalRoles: 6),
      );

      expect(
        () => MarsRescueLocalRepository.validatePackage(badPackage),
        throwsA(
          isA<PackageValidationException>().having(
            (e) => e.message,
            'message',
            contains('Duplicate role ID: r1'),
          ),
        ),
      );
    });

    test('validates package: throws on incorrect capacity constraint', () {
      final badPackage = MarsRescuePackage(
        id: 'mars_rescue',
        contentVersion: 'M1.1.0',
        locale: 'en-US',
        title: 'Mars Rescue',
        premise: 'Premise',
        stakesLine: 'Stakes',
        socialTruthLabel: 'Truth',
        audienceClassification: 'Adult 18+',
        estimatedMinutes: 3,
        roles: const [
          ArenaRole(id: 'r1', title: 'Role 1', description: 'Desc 1'),
          ArenaRole(id: 'r2', title: 'Role 2', description: 'Desc 2'),
          ArenaRole(id: 'r3', title: 'Role 3', description: 'Desc 3'),
          ArenaRole(id: 'r4', title: 'Role 4', description: 'Desc 4'),
          ArenaRole(id: 'r5', title: 'Role 5', description: 'Desc 5'),
          ArenaRole(id: 'r6', title: 'Role 6', description: 'Desc 6'),
        ],
        facts: const [ArenaFact(title: 'F1', detail: 'Detail')],
        constraint: const ArenaConstraint(
          capacity: 4,
          totalRoles: 6,
        ), // Capacity != 3
      );

      expect(
        () => MarsRescueLocalRepository.validatePackage(badPackage),
        throwsA(
          isA<PackageValidationException>().having(
            (e) => e.message,
            'message',
            contains('Seat constraint capacity must be 3'),
          ),
        ),
      );
    });

    test(
      'validates package: throws on invalid guardian relationship target',
      () {
        final badPackage = MarsRescuePackage(
          id: 'mars_rescue',
          contentVersion: 'M1.1.0',
          locale: 'en-US',
          title: 'Mars Rescue',
          premise: 'Premise',
          stakesLine: 'Stakes',
          socialTruthLabel: 'Truth',
          audienceClassification: 'Adult 18+',
          estimatedMinutes: 3,
          roles: const [
            ArenaRole(
              id: 'r1',
              title: 'Role 1',
              description: 'Desc 1',
              guardianToRoleId: 'non_existent_role', // Non-existent
            ),
            ArenaRole(id: 'r2', title: 'Role 2', description: 'Desc 2'),
            ArenaRole(id: 'r3', title: 'Role 3', description: 'Desc 3'),
            ArenaRole(id: 'r4', title: 'Role 4', description: 'Desc 4'),
            ArenaRole(id: 'r5', title: 'Role 5', description: 'Desc 5'),
            ArenaRole(id: 'r6', title: 'Role 6', description: 'Desc 6'),
          ],
          facts: const [ArenaFact(title: 'F1', detail: 'Detail')],
          constraint: const ArenaConstraint(capacity: 3, totalRoles: 6),
        );

        expect(
          () => MarsRescueLocalRepository.validatePackage(badPackage),
          throwsA(
            isA<PackageValidationException>().having(
              (e) => e.message,
              'message',
              contains('non-existent guardian target non_existent_role'),
            ),
          ),
        );
      },
    );

    test('validates package: throws on empty locale or social truth label', () {
      final badPackage = MarsRescuePackage(
        id: 'mars_rescue',
        contentVersion: 'M1.1.0',
        locale: '  ', // Empty locale
        title: 'Mars Rescue',
        premise: 'Premise',
        stakesLine: 'Stakes',
        socialTruthLabel: 'Truth',
        audienceClassification: 'Adult 18+',
        estimatedMinutes: 3,
        roles: const [],
        facts: const [],
        constraint: const ArenaConstraint(capacity: 3, totalRoles: 6),
      );

      expect(
        () => MarsRescueLocalRepository.validatePackage(badPackage),
        throwsA(
          isA<PackageValidationException>().having(
            (e) => e.message,
            'message',
            contains('Package locale cannot be empty'),
          ),
        ),
      );
    });
  });
}
