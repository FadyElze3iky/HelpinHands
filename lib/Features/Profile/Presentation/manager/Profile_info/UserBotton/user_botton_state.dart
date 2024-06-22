// ignore_for_file: must_be_immutable

part of 'user_botton_cubit.dart';

@immutable
sealed class UserBottonState {}

final class UserInitial extends UserBottonState {}

// User
class isvisiable extends UserBottonState {
  bool check;
  isvisiable({required this.check});
}

// address
class visiable extends UserBottonState {
  bool check;
  visiable({required this.check});
}

// nickname

class ifvisiable extends UserBottonState {
  bool check;
  ifvisiable({required this.check});
}

// nickname

class ChronicDiseasesvisiable extends UserBottonState {
  bool check;
  ChronicDiseasesvisiable({required this.check});
}

// national id

class NationalIDvisiable extends UserBottonState {
  bool check;
  NationalIDvisiable({required this.check});
}

// national id

class FactoryNumvisiable extends UserBottonState {
  bool check;
  FactoryNumvisiable({required this.check});
}
