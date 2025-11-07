import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void loadTracks() {
    emit(const HomeLoading());
    // TODO: Implement actual data loading from repository
    // This is a skeleton implementation for demonstration
    emit(const HomeLoaded());
  }
}
