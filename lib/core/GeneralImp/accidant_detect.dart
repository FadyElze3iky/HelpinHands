import 'dart:async';
import 'dart:developer';

import 'package:flutter_google_maps_webservices/directions.dart';
import 'package:helping_hands/Features/Home/data/home_impl.dart';
import 'package:helping_hands/Features/findContact/data/find_contact_imp.dart';
import 'package:helping_hands/core/GeneralImp/notifications_util.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccidentDetection {
  void chickAccident() async {
    // Threshold for detecting an accident
    // _handleAccident();
    double _accelerometerThreshold = 1000;
    double _gyroscopeThreshold = 40.0;
    // Subscription to the accelerometer and gyroscope streams
    // Subscribe to the accelerometer stream
    final StreamSubscription<AccelerometerEvent> _accelerometerSubscription =
        accelerometerEventStream().listen((AccelerometerEvent event) {
      double _accelerometerX = event.x;
      double _accelerometerY = event.y;
      double _accelerometerZ = event.z;

      // Check for an accident based on the accelerometer values
      if (_isAccident(_accelerometerX, _accelerometerY, _accelerometerZ,
          _accelerometerThreshold)) {
        _handleAccident();
      }
    });

    // Subscribe to the gyroscope stream
    final StreamSubscription<GyroscopeEvent> _gyroscopeSubscription =
        gyroscopeEventStream().listen((GyroscopeEvent event) {
      double _gyroscopeX = event.x;
      double _gyroscopeY = event.y;
      double _gyroscopeZ = event.z;
      // Check for an accident based on the gyroscope values
      if (_isAccident(
          _gyroscopeX, _gyroscopeY, _gyroscopeZ, _gyroscopeThreshold)) {
        _handleAccident();
      }
    });

    chickEmergencyContactLocations();
    chickNearbyReports();
  }

// Check if the sensor values indicate an accident
  bool _isAccident(double x, double y, double z, double threshold) {
    double magnitude = x.abs() + y.abs() + z.abs();
    return magnitude > threshold;
  }

  void _handleAccident() async {
    NotificationUtils.showNotificationWithTimeout(0);
  }

  void chickEmergencyContactLocations() async {
    try {
      Timer.periodic(Duration(seconds: 5), (Timer timer) async {
        final data = await FindContactImp().getContactsLocation();
        int offsethours = DateTime.now().timeZoneOffset.inHours;
        for (int i = 0; i < data.length; i++) {
          String apiTime = data[i]['date'];
          DateTime contactDate = DateTime.parse(apiTime);
          DateTime localtime = contactDate.add(Duration(hours: offsethours));
          if (DateTime.now().difference(localtime).inSeconds < 9) {
            NotificationUtils().showBasicNotification(
                4,
                data[i]['data'][0]['username'],
                'Your emergency contact shared his location');
            timer.cancel();
            await Future.delayed(Duration(seconds: 5));
            chickEmergencyContactLocations();
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void chickNearbyReports() async {
    try {
      int offsethours = DateTime.now().timeZoneOffset.inHours;
      SharedPreferences pref = await SharedPreferences.getInstance();

      Timer.periodic(Duration(seconds: 5), (Timer timer) async {
        final data = await HomeImpl().fetchNearbyReports();
        List<String> accidentList = pref.getStringList('accident') ?? [];
        for (int i = 0; i < data.length; i++) {
          String apiTime = data[i]['date'];
          DateTime contactDate = DateTime.parse(apiTime);
          DateTime localtime = contactDate.add(Duration(hours: offsethours));

          if (DateTime.now().difference(localtime).inHours < 5) {
            if (!accidentList.contains(data[i]['id'])) {
              String type = data[i]['type'];
              String distance = data[i]['distance'];
              if (distance.length > 4) {
                distance = distance.substring(0, 4);
              }
              NotificationUtils().showBasicNotification(
                  5, '${type}: $distance km', 'Some one post report near you');
              timer.cancel();
              accidentList.add(data[i]['id']);
              pref.setStringList('accident', accidentList);

              await Future.delayed(Duration(seconds: 5));
              chickNearbyReports();
            }
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
