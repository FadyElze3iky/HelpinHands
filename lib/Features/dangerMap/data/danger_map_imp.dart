import 'dart:convert';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/core/utils/api.dart';
import 'package:http/http.dart' as http;

class DangerMapImp {
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

  List<DangerLocation> dangerLocations = [];
  List<Map<String, double>> data1 = List.generate(
    3000,
    (index) => {
      'locationLat': Random().nextDouble() * (31.0 - 22.0) + 22.0,
      'locationLong': Random().nextDouble() * (35.0 - 25.0) + 25.0,
    },
  );
  Future<List<dynamic>> getAccidentsFromDB() async {
    List<dynamic> accidents = [];
    try {
      final response = await http.post(
        Uri.parse(DataBaseApi().getAllAccidentsUrl),
      );
      print(response.request.toString());
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['state'] == 1) {
          accidents = responseData['data'];
        }
      }
    } catch (e) {
      print(e.toString());
    }

    return accidents;
  }

  Future<void> getAccidentsListReal() async {
    List<dynamic> dynamicdata = await getAccidentsFromDB();
    List<Map<String, double>> data2 = [];
    for (var i = 0; i < dynamicdata.length; i++) {
      Map<String, double> map = {
        'locationLat': double.parse(dynamicdata[i]['locationLat']),
        'locationLong': double.parse(dynamicdata[i]['locationLong'])
      };
      data2.add(map);
    }
    dangerLocations = [];
    Uri url = Uri.parse('${DataBaseApi.flaskHost}/');
    final data = jsonEncode(data2);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      final response1 = await http.post(url, body: data, headers: headers);
      final response = jsonDecode(response1.body);
      for (var i = 0; i < response.length; i++) {
        dangerLocations.add(DangerLocation(
            latitude: response['$i']['center']['lat'],
            longitude: response['$i']['center']['long'],
            accidentNum: response['$i']['num_accidents'],
            avgDestance: response['$i']['average_distance']));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAccidentsListTest() async {
    dangerLocations = [];
    Uri url = Uri.parse('${DataBaseApi.flaskHost}/');
    final data = jsonEncode(data1);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      final response1 = await http.post(url, body: data, headers: headers);
      final response = jsonDecode(response1.body);
      for (var i = 0; i < response.length; i++) {
        dangerLocations.add(DangerLocation(
            latitude: response['$i']['center']['lat'],
            longitude: response['$i']['center']['long'],
            accidentNum: response['$i']['num_accidents'],
            avgDestance: response['$i']['average_distance']));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Set<Marker>> getMarkersTest() async {
    await getAccidentsListTest();
    int index = 0; // Initialize an index counter

    final markers = await Future.wait(dangerLocations.map((location) async {
      index++; // Increment the index for each marker
      return Marker(
        markerId: MarkerId(
            index.toString()), // Use the index as the unique identifier
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: 'Number of accidents: ${location.accidentNum}',
          snippet: 'Average distance: ${location.avgDestance.round()} km',
        ),
        icon: _getMarkerColor(location.accidentNum.toInt()),
      );
    }));

    return markers.toSet();
  }

  Future<Set<Marker>> getMarkersReal() async {
    await getAccidentsListReal();
    int index = 0; // Initialize an index counter

    final markers = await Future.wait(dangerLocations.map((location) async {
      index++; // Increment the index for each marker
      return Marker(
        markerId: MarkerId(
            index.toString()), // Use the index as the unique identifier
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: 'Number of accidents: ${location.accidentNum}',
          snippet: 'Average distance: ${location.avgDestance.round()} km',
        ),
        icon: _getMarkerColor(location.accidentNum.toInt()),
      );
    }));

    return markers.toSet();
  }

  BitmapDescriptor _getMarkerColor(int accidentNum) {
    if (accidentNum < 5) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else if (accidentNum < 10) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
    } else if (accidentNum < 15) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
    } else if (accidentNum < 20) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
    } else if (accidentNum < 25) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
    } else {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
  }
}

class DangerLocation {
  final double latitude;
  final double longitude;
  final int accidentNum;
  final double avgDestance;

  DangerLocation({
    required this.latitude,
    required this.longitude,
    required this.accidentNum,
    required this.avgDestance,
  });
}
