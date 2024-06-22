import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapImp {
  GoogleMapsPlaces placesApiClient =
      GoogleMapsPlaces(apiKey: 'AIzaSyBwWoHyvO4FHdsmooJFSOC2TwdzWOUO5Bc');
  late Position _currentPosition;

  getCurrentLocation(GoogleMapController googleMapController) async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            zoom: 13,
          ),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Place>> fetchPlaces(String query) async {
    final response = await placesApiClient.searchByText(query);
    final places = response.results
        .map((result) => Place(
              id: result.placeId,
              name: result.name,
              latitude: result.geometry!.location.lat,
              longitude: result.geometry!.location.lng,
            ))
        .toList();

    return places;
  }

  Future<List<Marker>> getMarkers(String query) async {
    // Use a place search API (e.g., Google Places API) to fetch results
    List<Place> places = await fetchPlaces(query);

    List<Marker> markers = places
        .map((place) => Marker(
              markerId: MarkerId(place.id!),
              position: LatLng(place.latitude!, place.longitude!),
              infoWindow: InfoWindow(title: place.name),
              onTap: () {},
            ))
        .toList();
    return markers;
  }

  Marker getMark(Place place) {
    Marker marker = Marker(
      markerId: MarkerId(place.id!),
      position: LatLng(place.latitude!, place.longitude!),
      infoWindow: InfoWindow(title: place.name),
      onTap: () {},
    );
    return marker;
  }
}

class Place {
  String? id;
  String? name;
  double? latitude;
  double? longitude;
  Place(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});
}
