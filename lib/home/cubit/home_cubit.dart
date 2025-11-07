import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void loadTracks() {
    emit(const HomeLoading());
    // Simulating data loading
    emit(const HomeLoaded());
  }
}
