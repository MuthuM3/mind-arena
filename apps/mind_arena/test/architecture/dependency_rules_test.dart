import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('frontend architecture', () {
    test('does not introduce generic dumping-ground directories', () {
      const prohibitedNames = {'screens', 'services', 'utils'};
      final violations = Directory('lib')
          .listSync(recursive: true)
          .whereType<Directory>()
          .where(
            (directory) => prohibitedNames.contains(
              directory.uri.pathSegments
                  .where((segment) => segment.isNotEmpty)
                  .last,
            ),
          )
          .map((directory) => directory.path)
          .toList();

      expect(
        violations,
        isEmpty,
        reason: 'Use an explicit ownership boundary.',
      );
    });

    test('keeps inward-facing layers independent of concrete data', () {
      final violations = <String>[];

      _inspectImports(
        roots: const ['lib/domain'],
        prohibitedImports: const [
          'package:flutter/',
          'package:mind_arena/accessibility/',
          'package:mind_arena/analytics/',
          'package:mind_arena/app/',
          'package:mind_arena/arenas/',
          'package:mind_arena/components/',
          'package:mind_arena/data/',
          'package:mind_arena/design/',
          'package:mind_arena/experience/',
          'package:mind_arena/offline/',
          'package:mind_arena/testing/',
        ],
        violations: violations,
      );

      _inspectImports(
        roots: const ['lib/experience', 'lib/components', 'lib/arenas'],
        prohibitedImports: const ['package:mind_arena/data/'],
        violations: violations,
      );

      expect(
        violations,
        isEmpty,
        reason: 'Domain stays pure and concrete data is selected at bootstrap.',
      );
    });
  });
}

void _inspectImports({
  required List<String> roots,
  required List<String> prohibitedImports,
  required List<String> violations,
}) {
  for (final root in roots) {
    final directory = Directory(root);
    if (!directory.existsSync()) {
      continue;
    }

    for (final file
        in directory
            .listSync(recursive: true)
            .whereType<File>()
            .where((file) => file.path.endsWith('.dart'))) {
      final lines = file.readAsLinesSync();
      for (var index = 0; index < lines.length; index += 1) {
        final line = lines[index].trimLeft();
        if (!line.startsWith('import ')) {
          continue;
        }

        for (final prohibitedImport in prohibitedImports) {
          if (line.contains(prohibitedImport)) {
            violations.add(
              '${file.path}:${index + 1} imports $prohibitedImport',
            );
          }
        }
      }
    }
  }
}
