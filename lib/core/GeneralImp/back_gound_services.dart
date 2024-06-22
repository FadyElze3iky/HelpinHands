import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:helping_hands/core/GeneralImp/accidant_detect.dart';
import 'package:helping_hands/core/GeneralImp/notifications_controller.dart';

class BackgoundServices {
  // this will be used as notification channel id
  static const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
  static const notificationId = 888;

  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,

          // auto start service
          autoStart: true,
          isForegroundMode: true,

          autoStartOnBoot: false,

          // foregroundServiceNotificationId: notificationId,
        ),
        iosConfiguration: IosConfiguration());
  }

  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    NotificationsController.initializeLocalNotifications;

    NotificationsController.initializeNotificationsEventListeners();

    AccidentDetection().chickAccident();
  }
}
