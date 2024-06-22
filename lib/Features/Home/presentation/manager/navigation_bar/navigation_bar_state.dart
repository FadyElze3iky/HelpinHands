part of 'navigation_bar_cubit.dart';

@immutable
sealed class NavigationBarState {}

final class NavigationBarInitial extends NavigationBarState {}

// ignore: must_be_immutable
final class selected extends NavigationBarState {
  selected({required this.index});
  int index;
}
