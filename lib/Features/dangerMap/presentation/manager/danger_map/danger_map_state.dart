part of 'danger_map_cubit.dart';

@immutable
sealed class DangerMapState {}

final class DangerMapInitial extends DangerMapState {}

final class GetMarkersLoading extends DangerMapState {}

final class GetMarkersSuccess extends DangerMapState {
  final Set<Marker> markers;
  GetMarkersSuccess({required this.markers});
}

final class GetMarkersFailure extends DangerMapState {
  final String error;
  GetMarkersFailure({required this.error});
}
