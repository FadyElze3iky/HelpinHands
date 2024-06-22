part of 'acc_on_map_cubit.dart';

@immutable
sealed class AccOnMapState {}

final class AccOnMapInitial extends AccOnMapState {}

final class AccOnMapLoading extends AccOnMapState {}

final class AccOnMapSuccess extends AccOnMapState {
  String distance;
  AccOnMapSuccess({required this.distance});
}

final class AccOnMapFailure extends AccOnMapState {
  String error;
  AccOnMapFailure({required this.error});
}
