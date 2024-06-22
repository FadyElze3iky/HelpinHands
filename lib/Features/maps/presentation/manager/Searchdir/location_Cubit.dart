import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/Features/maps/data/map_imp.dart';
import 'package:meta/meta.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  void setResultVisiable(bool visiable) {
    emit(VisiableChange(visiable: visiable));
  }

  void getPlaces(String query) async {
    emit(getPlaceWating());
    try {
      List<Place> places = await MapImp().fetchPlaces(query);
      emit(getPlaceSuccess(place: places));
    } catch (e) {
      emit(getPlaceFeilure(error: e.toString()));
    }
  }

  void getMarkes(String query) async {
    emit(getMarkesWating());
    try {
      List<Marker> places = await MapImp().getMarkers(query);
      emit(getMarkesSuccess(marker: places));
    } catch (e) {
      emit(getMarkesFeilure(error: e.toString()));
    }
  }

  void getMark(Place place) {
    emit(getMarkeWating());
    try {
      Marker marker = MapImp().getMark(place);
      emit(getMarkeSuccess(marker: marker));
    } catch (e) {
      emit(getMarkeFeilure(error: e.toString()));
    }
  }

  void setController(String text) {
    emit(setTextController(controller: TextEditingController(text: text)));
  }
}
