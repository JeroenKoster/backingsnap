# BackingSnap

Scan your sheet music, get an instant backing track. A mobile app for musicians built with Flutter.

## Features

- 🎵 Music track management
- 🏗️ Screaming (feature-first) architecture
- 🧪 Comprehensive testing with BLoC test and Patrol
- 📦 Type-safe models with dart_mappable

## Architecture

This project follows a **screaming architecture** (feature-first) pattern where features are organized by domain rather than by technical layer:

```
lib/
└── home/
    ├── models/      # Domain models (Track)
    ├── cubit/       # State management (HomeCubit)
    └── view/        # UI components (HomePage)
```

## Dependencies

### Production Dependencies
- `flutter_bloc` - State management using the BLoC pattern
- `dart_mappable` - Type-safe JSON serialization

### Development Dependencies
- `bloc_test` - Testing utilities for BLoC
- `mocktail` - Mocking library for tests
- `very_good_analysis` - Lint rules
- `build_runner` - Code generation
- `dart_mappable_builder` - Code generation for dart_mappable
- `patrol` - Integration testing

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Installation

1. Clone the repository
```bash
git clone https://github.com/JeroenKoster/backingsnap.git
cd backingsnap
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate code for models
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the App

```bash
flutter run
```

### Running Tests

Run unit tests:
```bash
flutter test
```

Run integration tests:
```bash
flutter test integration_test/
```

### Code Generation

When you modify models with `@MappableClass()` annotation, regenerate code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

For continuous generation during development:
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Linting

This project uses `very_good_analysis` for linting. Run the analyzer:

```bash
flutter analyze
```

## Project Structure

```
backingsnap/
├── lib/
│   ├── main.dart                    # App entry point
│   └── home/                        # Home feature
│       ├── cubit/
│       │   ├── home_cubit.dart     # Business logic
│       │   └── home_state.dart     # State definitions
│       ├── models/
│       │   └── track.dart          # Track model
│       └── view/
│           └── home_page.dart      # Home UI
├── test/
│   └── home/
│       └── cubit/
│           └── home_cubit_test.dart # Unit tests
├── integration_test/
│   └── app_test.dart               # Integration tests
├── pubspec.yaml                     # Dependencies
└── analysis_options.yaml            # Lint rules
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.
