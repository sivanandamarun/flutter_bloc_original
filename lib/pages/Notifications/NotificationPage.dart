import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatelessWidget {
  final RemoteMessage? message;
    NotificationPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('${message?.notification?.title}'),
            Text('${message?.notification?.body}'),
            Text('${message?.data}'),
          ],
        ),
      ),
    );
  }
}

