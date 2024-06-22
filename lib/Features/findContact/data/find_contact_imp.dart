import 'dart:convert';
import 'dart:developer';

import 'package:background_location/background_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';
import 'package:http/http.dart' as http;

class FindContactImp {
  Future<List<dynamic>> getcontactslist() async {
    final contactsList = await profileImpl().getContactsUidDB();
    return contactsList;
  }

  Future<List<dynamic>> getContactsLocation() async {
    List<dynamic> users = [];
    final userUids = await getcontactslist();
    try {
      var requestBody = jsonEncode(userUids);

      var response = await http.post(
        Uri.parse(DataBaseApi().getContactsLocationUrl),
        body: {'userIds': requestBody},
      );
      if (response.statusCode == 200) {
        users = jsonDecode(response.body);
      } else {}
    } catch (e) {
      print('Error during get user data: $e');
    }

    return users;
  }

  Location? lastLocation;

  Future<bool> startLocationUpdates() async {
    bool success = false;
    // Check for permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission denied');
        success = false;
      }
    }
    try {
      Position location = await Geolocator.getCurrentPosition();
      try {
        String uid = await profileImpl().getUid();
        var response = await http.post(
          Uri.parse(DataBaseApi().updateLocationUrl),
          body: {
            'uid': uid,
            'locationLat': location.latitude.toString(),
            'locationLong': location.longitude.toString(),
          },
        );
        log(response.body.toString());
        if (response.statusCode == 200) {
          final res = jsonDecode(response.body);
          if (res['state'] == 1) {
            success = true;
          }
        } else {
          success = false;
        }
      } catch (e) {
        success = false;
      }
    } catch (e) {
      success = false;
    }
    return success;
  }

  Future<bool> deleteLocation() async {
    String uid = await profileImpl().getUid();
    final response = await http.post(
      Uri.parse(DataBaseApi().deleteLocationUrl),
      body: {'uid': uid},
    );
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['state'] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
