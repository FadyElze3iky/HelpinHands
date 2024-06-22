import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';
import 'package:http/http.dart' as http;

class HomeImpl {
  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("User denied the permission.");
      }
    }
  }

  Future<List<dynamic>> fetchNearbyReports() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("User denied the permission.");
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<dynamic> data = [];
    try {
      int offsethours = DateTime.now().timeZoneOffset.inHours;

      var response = await http.post(
        Uri.parse(DataBaseApi().getPostUrl),
        body: {
          'yourLat': position.latitude.toString(),
          'yourLong': position.longitude.toString(),
          'timezoneOffset': offsethours.toString(),
        },
      );

      if (response.statusCode == 200) {
        data = jsonDecode(response.body)['data'];
      }
    } catch (e) {
      // Handle any errors that may occur during the fetching process
      log(e.toString());
    }

    return data;
  }

  Future<String> ReportPost({required String id}) async {
    String uid = await profileImpl().getUid();

    String message = '';
    try {
      var response = await http.post(
        Uri.parse(DataBaseApi().reportPorstUrl),
        body: {
          'uid': uid,
          'id': id,
        },
      );

      if (response.statusCode == 200) {
        message = jsonDecode(response.body)['message'];
      }
    } catch (e) {
      // Handle any errors that may occur during the fetching process
      log(e.toString());
    }
    return message;
  }
}
