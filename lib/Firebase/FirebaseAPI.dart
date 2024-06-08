import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class FirebaseAPI {
  // create a instance of firebase messaging
  final firebaseInstance = FirebaseMessaging.instance;

  final androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'high_importance_notifications',
      description: 'sdfsdfsd', importance: Importance.defaultImportance);

  final localNotification = FlutterLocalNotificationsPlugin();

  //initialize the notification
  Future<void> initNotification() async {
    firebaseInstance.requestPermission();
    final token = await firebaseInstance.getToken();
    print(token);
    initPushNotification();
    initLocalNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed('notification', arguments: message);
  }

  Future<void> initPushNotification() async {
    firebaseInstance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              androidChannel.id, androidChannel.name,
              channelDescription: androidChannel.description,
              icon: '@drawable/ic_launcher'
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotification() async {

    const initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(
        android: androidInitializationSettings, iOS: initializationSettingsIOS);
    await localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message =
            RemoteMessage.fromMap(jsonDecode(details.payload!.toString()));
        handleMessage(message);
      },
    );
    final platform = localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidChannel);
  }

/*final firebase = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await firebase.requestPermission();
    final token = await firebase.getToken();
    // if (kDebugMode) {
      print('$token');
    // }
    // FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message){
    if(message==null) return;
    navigatorKey.currentState?.pushNamed('notification',arguments: message);
  }

  Future initPushNotifications() async{
   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
     alert: true,
     badge: true,
     sound: true
   );
   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
   FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  }*/
}
