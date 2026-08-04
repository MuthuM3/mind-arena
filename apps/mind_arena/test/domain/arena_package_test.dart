import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/domain/models/arena_package.dart';
import 'package:mind_arena/domain/models/arena_package_exceptions.dart';

void main() {
  group('ArenaPackage Domain Models', () {
    test('ArenaRole equality and copy properties', () {
      const role1 = ArenaRole(
        id: 'physician',
        title: 'Physician',
        description: 'Medical care',
      );
      const role2 = ArenaRole(
        id: 'physician',
        title: 'Physician',
        description: 'Medical care',
      );
      const role3 = ArenaRole(
        id: 'physician',
        title: 'Physician',
        description: 'Different care',
      );

      expect(role1, equals(role2));
      expect(role1.hashCode, equals(role2.hashCode));
      expect(role1 == role3, isFalse);
    });

    test('ArenaConstraint equality', () {
      const constraint1 = ArenaConstraint(capacity: 3, totalRoles: 6);
      const constraint2 = ArenaConstraint(capacity: 3, totalRoles: 6);
      const constraint3 = ArenaConstraint(capacity: 4, totalRoles: 6);

      expect(constraint1, equals(constraint2));
      expect(constraint1 == constraint3, isFalse);
    });

    test('PackageValidationException formats string', () {
      const ex = PackageValidationException('Invalid role count');
      expect(
        ex.toString(),
        contains('PackageValidationException: Invalid role count'),
      );
    });
  });
}
