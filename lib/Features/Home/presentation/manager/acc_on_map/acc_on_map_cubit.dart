import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'acc_on_map_state.dart';

class AccOnMapCubit extends Cubit<AccOnMapState> {
  AccOnMapCubit() : super(AccOnMapInitial());
  final locationStreem = Geolocator.getPositionStream();
  StreamSubscription<Position>? streem;
  void GetDistance(List ReportLocation) {
    emit(AccOnMapLoading());
    try {
      streem = locationStreem.listen((event) {
        final currentlocation = LatLng(event.latitude, event.longitude);
        final reportLocation = LatLng(ReportLocation[0], ReportLocation[1]);
        double distance = Distance().distance(currentlocation, reportLocation);
        if (distance >= 1000) {
          distance = distance / 1000;
          emit(AccOnMapSuccess(distance: '$distance km away'));
          print(distance);
        } else {
          emit(AccOnMapSuccess(distance: '$distance m away'));
          print(distance);
        }
      });
    } catch (e) {
      emit(AccOnMapFailure(error: e.toString()));
    }
  }
}
