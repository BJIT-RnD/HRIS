import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Data: ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;
}

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // foreground
  final androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important nottifications',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      //final message = RemoteMessage.fromMap(jsonDecode(payload));
      print('local payload $payload');
    });

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidChannel);
  }

  Future<void> initNotifications() async {
    //foreground adding
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _firebaseMessaging.requestPermission();
    try {
      final fCMToken = await _firebaseMessaging.getToken();
      print('Token: $fCMToken');
      // Use fCMToken as needed
    } catch (e) {
      // Handle the exception here
      print('Error getting FCM token: $e');
    }
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //terminated
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    //background
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) {
        return;
      }

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }
}
