import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/Features/dangerMap/data/danger_map_imp.dart';
import 'package:meta/meta.dart';

part 'danger_map_state.dart';

class DangerMapCubit extends Cubit<DangerMapState> {
  DangerMapCubit() : super(DangerMapInitial());
  void getMarkersTest() async {
    emit(GetMarkersLoading());
    try {
      final markers = await DangerMapImp().getMarkersTest();
      emit(GetMarkersSuccess(markers: markers));
    } catch (e) {
      emit(GetMarkersFailure(error: e.toString()));
    }
  }

  void getMarkersReal() async {
    emit(GetMarkersLoading());
    try {
      final markers = await DangerMapImp().getMarkersReal();
      emit(GetMarkersSuccess(markers: markers));
    } catch (e) {
      emit(GetMarkersFailure(error: e.toString()));
    }
  }
}
