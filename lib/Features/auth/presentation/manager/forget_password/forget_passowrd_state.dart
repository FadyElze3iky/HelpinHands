part of 'forget_passowrd_cubit.dart';

@immutable
sealed class ForgetPassowrdState {}

final class ForgetPassowrdInitial extends ForgetPassowrdState {}

class ChangeVisiablity extends ForgetPassowrdState {
  final bool isVisible;

  ChangeVisiablity({required this.isVisible});
}
