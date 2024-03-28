import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> initMessaging() async {
    NotificationSettings settings = await messaging.requestPermission();
    debugPrint('User granted permission: ${settings.authorizationStatus}');
    debugPrint('token: ${await messaging.getToken()}');
  }

  Future<void> sendMsg() async {}
}
