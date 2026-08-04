import 'package:meta/meta.dart';

/// Exception thrown when a loaded arena package fails structural domain validation.
@immutable
final class PackageValidationException implements Exception {
  const PackageValidationException(this.message);

  final String message;

  @override
  String toString() => 'PackageValidationException: $message';
}
