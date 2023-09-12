import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/data/response_model/anime_model.dart';
import 'package:flutter_base_project/domain/todo_usecase.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  final repo = TodoUsecase();

  void getFacts() async {
    emit(HomeCubitLoading());
    try {
      final resutl = await repo.getFacts();
      emit(HomeCubitLoaded(data: resutl));
    } catch (e) {
      emit(HomeCubitError());
    }
  }
}
