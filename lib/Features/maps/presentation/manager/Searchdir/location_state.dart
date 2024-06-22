part of 'location_Cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class getPlaceWating extends LocationState {}

final class getPlaceSuccess extends LocationState {
  List<Place> place;
  getPlaceSuccess({required this.place});
}

final class getPlaceFeilure extends LocationState {
  String error;
  getPlaceFeilure({required this.error});
}

final class getMarkesWating extends LocationState {}

final class getMarkesSuccess extends LocationState {
  List<Marker> marker;
  getMarkesSuccess({required this.marker});
}

final class getMarkesFeilure extends LocationState {
  String error;
  getMarkesFeilure({required this.error});
}

final class VisiableChange extends LocationState {
  bool visiable;
  VisiableChange({required this.visiable});
}

final class getMarkeWating extends LocationState {}

final class getMarkeSuccess extends LocationState {
  Marker marker;
  getMarkeSuccess({required this.marker});
}

final class getMarkeFeilure extends LocationState {
  String error;
  getMarkeFeilure({required this.error});
}

final class setTextController extends LocationState {
  TextEditingController controller;
  setTextController({required this.controller});
}
