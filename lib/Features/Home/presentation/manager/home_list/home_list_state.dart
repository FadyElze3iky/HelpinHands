part of 'home_list_cubit.dart';

@immutable
sealed class HomeListState {}

final class HomeListInitial extends HomeListState {}

final class GetDataLoading extends HomeListState {}

final class GetDataSuccess extends HomeListState {
  List list;
  GetDataSuccess({required this.list});
}

final class GetDataFailure extends HomeListState {
  String error;
  GetDataFailure({required this.error});
}
