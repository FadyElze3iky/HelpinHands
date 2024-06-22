part of 'contacts_cubit.dart';

@immutable
sealed class ContactsState {}

final class ContactsInitial extends ContactsState {}

final class WatingC extends ContactsState {}

class SuccessfflyC extends ContactsState {
  SuccessfflyC({required this.list});
  final list;
}

// ignore: must_be_immutable
final class FailedC extends ContactsState {
  FailedC({required this.error});
  String? error;
}
