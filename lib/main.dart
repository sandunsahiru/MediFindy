import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pharmacy_appnew/pages/services/cloud_funtions.dart';
import 'package:pharmacy_appnew/pages/services/firebase_messaging.dart';
import 'package:pharmacy_appnew/pages/widget/In_app_notification.dart';
import 'pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy_appnew/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> backgroundMsgHandler(RemoteMessage message) async {
  debugPrint("Message data: ${message.notification?.title}");
  final notification = InAppNotification();
  if (message.notification?.title == 'New Special Request') {
    notification.showNotificationWithAction(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data,
    );
  } else {
    notification.showAvailableNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kDebugMode) {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.appAttest,
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    );
  } else {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.debug,
    );
  }
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'default_channel',
        channelName: 'Default Channel',
        channelDescription: 'Notifications about new medicine requests',
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelKey: 'available_channel',
        channelName: 'Available Channel',
        channelDescription: 'Notifications about available medicines',
        importance: NotificationImportance.High,
      )
    ],
    debug: true,
  );
  await FirebaseMessagingService().initMessaging();
  FirebaseMessaging.onBackgroundMessage(backgroundMsgHandler);
  // await InAppNotification().listenActionButtons();
  AwesomeNotifications().setListeners(onActionReceivedMethod: (action) async {
    print('Button pressed: ${action.buttonKeyPressed}');
    print('title: ${action.title ?? ""}');
    print('payload: ${action.payload != null ? action.payload : "NuLLnull"}');
    print("message id: ${action.id ?? ""}");
    if (action.buttonKeyPressed == 'MARK_DONE') {
      print('Marked as done');
      try {
        await CloudFunctions().sendAvailableMsg(
          user_id: action.payload!['user_id'] ?? '',
          medicineName: action.payload!['medicine_name'] ?? '',
          quantity: action.payload!['quantity'] ?? '',
          reqId: action.payload!['request_id'] ?? '',
        );
      } on FirebaseFunctionsException catch (e) {
        print('FirebaseFunctionsException: ${e.code}\n${e.details}');
      } catch (e) {
        print('Exception: $e');
      }
    } else if (action.buttonKeyPressed == 'DISMISS') {
      print('Dismissed');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
