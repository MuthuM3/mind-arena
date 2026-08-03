# Mind Arena client

Cross-platform Flutter shell for the Mind Arena experience. Product implementation is intentionally
gated by the M1.4 experience-design approvals in the frontend architecture guide.

Every future user-observable slice must support compact mobile, medium tablet, and expanded
laptop/desktop windows from its first implementation. Responsive behavior includes touch,
keyboard, pointer, text scaling, reduced motion, and state-preserving resize. Performance is an
acceptance criterion from the first scene, measured in profile or release mode rather than inferred
from debug builds.

## Prerequisites

- Flutter 3.44.8 or a compatible later stable release below 4.0
- Dart 3.12 or a compatible SDK
- Native platform tooling for the target being run

## Local checks

From the repository root, run the complete client setup gate:

```bash
./scripts/verify-client.sh
```

The equivalent individual commands are:

```bash
flutter pub get
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
flutter build web --debug
```

The application environment is selected without secrets:

```bash
flutter run --dart-define=APP_ENV=development
```

Supported values are `development`, `staging`, and `production`. This setup contains no backend,
live AI, product scenes, visual design implementation, fixtures, or human-perspective content.

The top-level frontend ownership boundaries are recorded in
[`lib/ARCHITECTURE.md`](lib/ARCHITECTURE.md). Their README files preserve the intended structure
without introducing unused framework code. Automated architecture tests prevent generic dumping
grounds and concrete data imports into inward-facing layers.

Native application identifiers and store-specific development/staging flavors are intentionally
deferred until a connected service or distribution milestone needs them. `APP_ENV` is the only
environment selector in the backend-free experience prototype, which avoids maintaining unused
platform configuration.
