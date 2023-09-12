import 'package:flutter_base_project/utils/common/theme_provider.dart';
import 'package:flutter_base_project/utils/config/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(super.initialState);

  void changeThemeApp() {
    AppConfig.instance.appTheme = AppConfig.instance.appTheme == AppTheme.dark
        ? AppTheme.light
        : AppTheme.dark;
    emit(AppThemeDarkState());
  }

  void changeLanguage() {
    emit(AppLanguageInitState());
  }
}

abstract class AppState {}

class AppInitState extends AppState {}

class AppThemeInitState extends AppState {}

class AppThemeDarkState extends AppState {}

class AppLanguageInitState extends AppState {}
