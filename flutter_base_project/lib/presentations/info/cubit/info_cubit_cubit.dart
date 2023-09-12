import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'info_cubit_state.dart';

class InfoCubitCubit extends Cubit<InfoCubitState> {
  InfoCubitCubit() : super(InfoCubitInitial());
}
