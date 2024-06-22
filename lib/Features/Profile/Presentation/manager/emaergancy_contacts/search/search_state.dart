part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class Wating extends SearchState {}

class Successffly extends SearchState {
  Successffly({required this.list});
  List<dynamic> list;
}

// ignore: must_be_immutable
final class Failed extends SearchState {
  Failed({required this.error});
  String? error;
}
