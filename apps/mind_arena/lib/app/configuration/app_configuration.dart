import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppEnvironment {
  development,
  staging,
  production;

  static AppEnvironment parse(String value) => switch (value) {
    'development' => AppEnvironment.development,
    'staging' => AppEnvironment.staging,
    'production' => AppEnvironment.production,
    _ => throw ArgumentError.value(value, 'APP_ENV', 'Unsupported environment'),
  };
}

final class AppConfiguration {
  const AppConfiguration({required this.environment});

  factory AppConfiguration.fromEnvironment() {
    const environment = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    );

    return AppConfiguration(environment: AppEnvironment.parse(environment));
  }

  final AppEnvironment environment;
}

final appConfigurationProvider = Provider<AppConfiguration>(
  (ref) => throw StateError('AppConfiguration must be provided at bootstrap.'),
);
