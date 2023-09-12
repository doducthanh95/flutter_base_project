part of 'home_cubit.dart';

abstract class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {
  final List<AnimeModel>? data;
  HomeCubitLoaded({this.data});
}

final class HomeCubitError extends HomeCubitState {}
