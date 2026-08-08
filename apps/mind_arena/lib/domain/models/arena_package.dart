import 'package:meta/meta.dart';

/// Represents a role in the arena scenario.
@immutable
final class ArenaRole {
  const ArenaRole({
    required this.id,
    required this.title,
    required this.description,
    this.categoryTag,
    this.guardianToRoleId,
    this.guardianRelationshipLabel,
  });

  final String id;
  final String title;
  final String description;
  final String? categoryTag;
  final String? guardianToRoleId;
  final String? guardianRelationshipLabel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaRole &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          categoryTag == other.categoryTag &&
          guardianToRoleId == other.guardianToRoleId &&
          guardianRelationshipLabel == other.guardianRelationshipLabel;

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    categoryTag,
    guardianToRoleId,
    guardianRelationshipLabel,
  );

  @override
  String toString() =>
      'ArenaRole(id: $id, title: $title, categoryTag: $categoryTag, guardianToRoleId: $guardianToRoleId)';
}

/// Represents an immutable public fact in the scenario.
@immutable
final class ArenaFact {
  const ArenaFact({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaFact &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          detail == other.detail;

  @override
  int get hashCode => Object.hash(title, detail);

  @override
  String toString() => 'ArenaFact(title: $title)';
}

/// Defines the seat constraint for role selection in the scenario.
@immutable
final class ArenaConstraint {
  const ArenaConstraint({this.capacity = 3, this.totalRoles = 6});

  final int capacity;
  final int totalRoles;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArenaConstraint &&
          runtimeType == other.runtimeType &&
          capacity == other.capacity &&
          totalRoles == other.totalRoles;

  @override
  int get hashCode => Object.hash(capacity, totalRoles);

  @override
  String toString() =>
      'ArenaConstraint(capacity: $capacity, totalRoles: $totalRoles)';
}

/// Complete immutable content package for Mars Rescue Today's Arena.
@immutable
final class MarsRescuePackage {
  MarsRescuePackage({
    required this.id,
    required this.contentVersion,
    required this.locale,
    required this.title,
    required this.premise,
    required this.stakesLine,
    required this.socialTruthLabel,
    required this.audienceClassification,
    required this.estimatedMinutes,
    required List<ArenaRole> roles,
    required List<ArenaFact> facts,
    required this.constraint,
  }) : roles = List.unmodifiable(roles),
       facts = List.unmodifiable(facts);

  final String id;
  final String contentVersion;
  final String locale;
  final String title;
  final String premise;
  final String stakesLine;
  final String socialTruthLabel;
  final String audienceClassification;
  final int estimatedMinutes;
  final List<ArenaRole> roles;
  final List<ArenaFact> facts;
  final ArenaConstraint constraint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarsRescuePackage &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          contentVersion == other.contentVersion &&
          locale == other.locale &&
          title == other.title &&
          premise == other.premise &&
          stakesLine == other.stakesLine &&
          socialTruthLabel == other.socialTruthLabel &&
          audienceClassification == other.audienceClassification &&
          estimatedMinutes == other.estimatedMinutes &&
          _listEquals(roles, other.roles) &&
          _listEquals(facts, other.facts) &&
          constraint == other.constraint;

  @override
  int get hashCode => Object.hash(
    id,
    contentVersion,
    locale,
    title,
    premise,
    stakesLine,
    socialTruthLabel,
    audienceClassification,
    estimatedMinutes,
    Object.hashAll(roles),
    Object.hashAll(facts),
    constraint,
  );

  @override
  String toString() =>
      'MarsRescuePackage(id: $id, version: $contentVersion, locale: $locale, title: $title)';
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null || a.length != b.length) return false;
  for (var index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }
  return true;
}
