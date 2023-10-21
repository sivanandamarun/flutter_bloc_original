import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('TITLE ${message.notification?.title}');
    print('${message.notification?.body}');
    print('${message.data}');
  }
}

class FirebaseAPI {
  final firebase = FirebaseMessaging.instance;

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
  }
}
