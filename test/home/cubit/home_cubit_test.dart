import 'package:backingsnap/home/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = HomeCubit();
    });

    tearDown(() {
      homeCubit.close();
    });

    test('initial state is HomeInitial', () {
      expect(homeCubit.state, isA<HomeInitial>());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeLoaded] when loadTracks is called',
      build: () => HomeCubit(),
      act: (cubit) => cubit.loadTracks(),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoaded>(),
      ],
    );
  });
}
