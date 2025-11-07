# Development Guide

## Architecture Overview

This Flutter application follows the **Screaming Architecture** pattern (also known as feature-first architecture), where the codebase is organized by features rather than technical layers.

### Why Screaming Architecture?

The screaming architecture makes the application's purpose immediately visible. When you look at the project structure, you see features (`home`, `track`, etc.) rather than technical layers (`controllers`, `views`, `models`). This approach:

- Makes features self-contained and easier to maintain
- Improves code discoverability
- Facilitates feature-based development
- Reduces coupling between features

### Feature Structure

Each feature follows this structure:

```
feature_name/
├── models/      # Data models and domain entities
├── cubit/       # Business logic and state management (BLoC pattern)
├── view/        # UI components and widgets
└── repository/  # Data access layer (when needed)
```

## State Management

We use **BLoC (Business Logic Component)** pattern via `flutter_bloc` package:

### HomeCubit Example

```dart
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void loadTracks() {
    emit(const HomeLoading());
    // Business logic here
    emit(const HomeLoaded());
  }
}
```

### States

States are immutable classes representing different UI states:

```dart
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {}
```

## Models with dart_mappable

We use `dart_mappable` for type-safe JSON serialization:

```dart
@MappableClass()
class Track with TrackMappable {
  const Track({
    required this.id,
    required this.title,
    required this.artist,
    this.duration,
  });

  final String id;
  final String title;
  final String artist;
  final int? duration;
}
```

### Code Generation

After modifying models, run:
```bash
flutter pub run build_runner build
```

This generates `.mapper.dart` files with serialization logic.

## Test-Driven Development (TDD)

This project follows **Test-Driven Development** principles:

1. **Write Tests First**: Before implementing a feature, write the tests that define the expected behavior
2. **Red-Green-Refactor**: 
   - **Red**: Write a failing test
   - **Green**: Write minimal code to make the test pass
   - **Refactor**: Improve the code while keeping tests green
3. **Test Coverage**: Maintain high test coverage for business logic and critical paths

### TDD Workflow Example

```dart
// 1. Write the test first (RED)
blocTest<HomeCubit, HomeState>(
  'emits [HomeLoading, HomeLoaded] when loadTracks is called',
  build: () => HomeCubit(),
  act: (cubit) => cubit.loadTracks(),
  expect: () => [
    isA<HomeLoading>(),
    isA<HomeLoaded>(),
  ],
);

// 2. Implement minimal code to pass (GREEN)
class HomeCubit extends Cubit<HomeState> {
  void loadTracks() {
    emit(const HomeLoading());
    emit(const HomeLoaded());
  }
}

// 3. Refactor as needed while keeping tests green
```

## Testing Strategy

### Unit Testing with bloc_test

Test business logic in isolation:

```dart
blocTest<HomeCubit, HomeState>(
  'emits [HomeLoading, HomeLoaded] when loadTracks is called',
  build: () => HomeCubit(),
  act: (cubit) => cubit.loadTracks(),
  expect: () => [
    isA<HomeLoading>(),
    isA<HomeLoaded>(),
  ],
);
```

### Integration Testing with Patrol

Test complete user flows:

```dart
patrolTest('app shows welcome message and can load tracks', ($) async {
  await $.pumpWidgetAndSettle(const App());
  
  expect($('Welcome to BackingSnap'), findsOneWidget);
  
  await $(FloatingActionButton).tap();
  await $.pumpAndSettle();
  
  expect($('Tracks loaded successfully!'), findsOneWidget);
});
```

### Testing Best Practices

1. **Unit tests**: Test each cubit/bloc in isolation
2. **Widget tests**: Test individual widgets
3. **Integration tests**: Test complete user flows
4. **Mocking**: Use `mocktail` for mocking dependencies
5. **Coverage**: Aim for >80% code coverage

## Code Style

This project uses `very_good_analysis` lint rules, which enforce:

- Consistent code formatting
- Best practices for Flutter/Dart
- Type safety
- Documentation requirements

Run the analyzer:
```bash
flutter analyze
```

Format code:
```bash
flutter format .
```

## Development Workflow (TDD Approach)

This project follows Test-Driven Development. For each new feature:

1. **Write Tests First**
   - Create test file: `test/feature_name/cubit/feature_cubit_test.dart`
   - Define expected behavior with failing tests
   - Run tests to confirm they fail (RED)

2. **Implement Minimal Code**
   - Create cubit in `lib/feature_name/cubit/`
   - Define states
   - Write minimal code to pass tests (GREEN)

3. **Refactor**
   - Improve code quality
   - Keep tests passing
   - Add models and UI

4. **Add Models**
   - Create model in `feature_name/models/`
   - Add `@MappableClass()` annotation
   - Generate code with build_runner

5. **Build UI**
   - Create widgets in `feature_name/view/`
   - Use `BlocBuilder` or `BlocConsumer` to react to state changes
   - Write widget tests if needed

6. **Run Checks**
   ```bash
   flutter analyze
   flutter test
   flutter test integration_test/
   ```

## Continuous Integration

Before committing, ensure:
- [ ] Code is formatted (`flutter format .`)
- [ ] No analyzer warnings (`flutter analyze`)
- [ ] All tests pass (`flutter test`)
- [ ] Code is generated for models (`build_runner`)

## Adding Dependencies

1. Add to `pubspec.yaml`
2. Run `flutter pub get`
3. Update this documentation if it's a significant dependency

## Troubleshooting

### Build runner issues
If code generation fails:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

### Test failures
- Ensure all generated files are up to date
- Check that mocks are properly configured
- Verify test data matches expected format

### Analyzer warnings
Most can be fixed with:
```bash
dart fix --apply
```

## Resources

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [dart_mappable Documentation](https://pub.dev/packages/dart_mappable)
- [Patrol Testing](https://patrol.leancode.co/)
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis)
