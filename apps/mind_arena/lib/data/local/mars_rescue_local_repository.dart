import 'package:mind_arena/domain/models/arena_package.dart';
import 'package:mind_arena/domain/models/arena_package_exceptions.dart';
import 'package:mind_arena/domain/repository_contracts/arena_repository.dart';

/// Local deterministic repository providing the Mars Rescue package.
final class MarsRescueLocalRepository implements ArenaRepository {
  const MarsRescueLocalRepository();

  static final _normalPackage = MarsRescuePackage(
    id: 'mars_rescue',
    contentVersion: 'M1.1.0',
    title: 'Mars Rescue',
    premise:
        'Main fusion reactor core containment has breached at an isolated surface outpost on Mars. Atmospheric and life-support collapse of the colony habitat is imminent.',
    stakesLine: 'One shuttle. Three seats. Six lives and six responsibilities.',
    audienceClassification: 'Adult-Only 18+',
    estimatedMinutes: 3,
    roles: const [
      ArenaRole(
        id: 'reactor_engineer',
        title: 'Reactor Engineer',
        description:
            'Responsible for colony power systems, life-support reactor operation, and executing the post-separation remote dampening fallback from the shuttle.',
      ),
      ArenaRole(
        id: 'physician',
        title: 'Physician',
        description:
            'Responsible for medical diagnostic assessment, emergency trauma response, and in-transit health management.',
      ),
      ArenaRole(
        id: 'shuttle_pilot',
        title: 'Shuttle Pilot',
        description:
            'Responsible for spacecraft pre-flight verification, orbital exit navigation, and shuttle landing maneuvers.',
      ),
      ArenaRole(
        id: 'agricultural_scientist',
        title: 'Agricultural Scientist',
        description:
            'Responsible for closed-loop food systems, bio-regenerative life support, and long-term crop ecology.',
      ),
      ArenaRole(
        id: 'young_dependent',
        title: 'Young Dependent',
        description:
            'A minor community member under formal guardianship, reliant on legal, physical, and emotional care.',
      ),
      ArenaRole(
        id: 'colony_coordinator',
        title: 'Colony Coordinator',
        description:
            'Responsible for administrative governance, habitat resource allocation, and formal guardian to the Young Dependent.',
        guardianToRoleId: 'young_dependent',
      ),
    ],
    facts: const [
      ArenaFact(
        title: 'Shuttle Capacity',
        detail:
            'The shuttle has exactly 3 seats and cannot carry 4 or more passengers.',
      ),
      ArenaFact(
        title: 'Colony Failure Imminent',
        detail:
            'Atmospheric and life-support failure at the colony is imminent once the reactor fails.',
      ),
      ArenaFact(
        title: 'Reactor Core Dampening',
        detail:
            "After shuttle separation, the reactor's final dampening command is issued through the shuttle control link. The Reactor Engineer is the only role trained to execute its manual fallback; the automated sequence remains available if the Engineer is not aboard.",
      ),
      ArenaFact(
        title: 'Operational Preparation',
        detail:
            'All six individuals have completed standard physical and operational prep for deep-space outpost duty.',
      ),
      ArenaFact(
        title: 'Guardian Relationship',
        detail:
            'The Colony Coordinator holds primary legal and caretaking responsibility for the Young Dependent.',
      ),
    ],
    constraint: const ArenaConstraint(capacity: 3, totalRoles: 6),
  );

  static final _malformedPackage = MarsRescuePackage(
    id: 'mars_rescue_malformed',
    contentVersion: 'M1.1.0',
    title: 'Mars Rescue',
    premise: 'Reactor failure',
    stakesLine: 'Broken package',
    audienceClassification: 'Adult-Only 18+',
    estimatedMinutes: 3,
    roles: const [
      ArenaRole(
        id: 'reactor_engineer',
        title: 'Reactor Engineer',
        description: 'Engine repair',
      ),
      // Missing remaining 5 roles
    ],
    facts: const [],
    constraint: const ArenaConstraint(capacity: 3, totalRoles: 6),
  );

  @override
  Future<MarsRescuePackage> loadMarsRescuePackage({
    ArenaTestMode mode = ArenaTestMode.normal,
  }) async {
    switch (mode) {
      case ArenaTestMode.unavailable:
        throw Exception('Mars Rescue package is currently unavailable.');
      case ArenaTestMode.malformed:
        _validatePackage(_malformedPackage);
        return _malformedPackage;
      case ArenaTestMode.normal:
        _validatePackage(_normalPackage);
        return _normalPackage;
    }
  }

  /// Validates package integrity according to domain invariants.
  static void _validatePackage(MarsRescuePackage package) {
    if (package.id.trim().isEmpty) {
      throw const PackageValidationException('Package ID cannot be empty.');
    }
    if (package.contentVersion.trim().isEmpty) {
      throw const PackageValidationException(
        'Package content version cannot be empty.',
      );
    }
    if (package.title.trim().isEmpty) {
      throw const PackageValidationException('Package title cannot be empty.');
    }
    if (package.premise.trim().isEmpty) {
      throw const PackageValidationException(
        'Package premise cannot be empty.',
      );
    }
    if (package.stakesLine.trim().isEmpty) {
      throw const PackageValidationException(
        'Package stakes line cannot be empty.',
      );
    }
    if (package.audienceClassification.trim().isEmpty) {
      throw const PackageValidationException(
        'Package audience classification cannot be empty.',
      );
    }
    if (package.estimatedMinutes <= 0) {
      throw const PackageValidationException(
        'Package estimated minutes must be greater than zero.',
      );
    }
    if (package.facts.isEmpty) {
      throw const PackageValidationException(
        'Package must contain at least one public fact.',
      );
    }
    for (final fact in package.facts) {
      if (fact.title.trim().isEmpty) {
        throw const PackageValidationException('Fact title cannot be empty.');
      }
      if (fact.detail.trim().isEmpty) {
        throw const PackageValidationException('Fact detail cannot be empty.');
      }
    }
    if (package.constraint.totalRoles != 6) {
      throw PackageValidationException(
        'Expected 6 total roles, got ${package.constraint.totalRoles}.',
      );
    }
    if (package.roles.length != 6) {
      throw PackageValidationException(
        'Package must define exactly 6 roles, found ${package.roles.length}.',
      );
    }

    final roleIds = <String>{};
    for (final role in package.roles) {
      if (role.id.trim().isEmpty) {
        throw const PackageValidationException('Role ID cannot be empty.');
      }
      if (role.title.trim().isEmpty) {
        throw PackageValidationException(
          'Role title cannot be empty for ${role.id}.',
        );
      }
      if (role.description.trim().isEmpty) {
        throw PackageValidationException(
          'Role description cannot be empty for ${role.id}.',
        );
      }
      if (!roleIds.add(role.id)) {
        throw PackageValidationException('Duplicate role ID: ${role.id}.');
      }
    }

    for (final role in package.roles) {
      if (role.guardianToRoleId != null) {
        if (!roleIds.contains(role.guardianToRoleId)) {
          throw PackageValidationException(
            'Role ${role.id} references non-existent guardian target ${role.guardianToRoleId}.',
          );
        }
      }
    }

    if (package.constraint.capacity != 3) {
      throw PackageValidationException(
        'Seat constraint capacity must be 3, got ${package.constraint.capacity}.',
      );
    }
  }
}
