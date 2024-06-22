part of 'contact_location_cubit.dart';

@immutable
sealed class ContactLocationState {}

final class ContactLocationInitial extends ContactLocationState {}

final class ContactsLoading extends ContactLocationState {}

// ignore: must_be_immutable
final class GetListSuccessfully extends ContactLocationState {
  List<dynamic> list;
  GetListSuccessfully(this.list);
}

// ignore: must_be_immutable
final class GetListFailure extends ContactLocationState {
  String error;
  GetListFailure(this.error);
}

final class liveLocationLoading extends ContactLocationState {}

final class LiveLocationSuccess extends ContactLocationState {
  final LiveLocation;
  LiveLocationSuccess(this.LiveLocation);
}

final class LiveLocationFailure extends ContactLocationState {
  String error;
  LiveLocationFailure(this.error);
}

class upDateMyLocation extends ContactLocationState {}
