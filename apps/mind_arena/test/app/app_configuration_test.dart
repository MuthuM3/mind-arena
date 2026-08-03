import 'package:flutter_test/flutter_test.dart';
import 'package:mind_arena/app/configuration/app_configuration.dart';

void main() {
  test('parses supported application environments', () {
    expect(AppEnvironment.parse('development'), AppEnvironment.development);
    expect(AppEnvironment.parse('staging'), AppEnvironment.staging);
    expect(AppEnvironment.parse('production'), AppEnvironment.production);
  });

  test('rejects unsupported application environments', () {
    expect(() => AppEnvironment.parse('unknown'), throwsArgumentError);
  });
}
