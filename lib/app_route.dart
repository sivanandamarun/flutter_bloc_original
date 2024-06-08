import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/pages/Notifications/NotificationPage.dart';
import 'package:flutterBlocOriginal/pages/SignUp/SignUp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterBlocOriginal/cubit/login_cubit.dart';
import 'pages/unittest/UnitTestCaseExample.dart';
import 'pages/LoginPage.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/" :
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>(
              create: (_) => LoginCubit(),
              child: Login(),
            )
        );




      case "signUp" :
        return MaterialPageRoute(
            builder: (context) => SignUp(),
        );

      case "notification" :
        var data = settings.arguments as RemoteMessage;
        return MaterialPageRoute(
          builder: (context) => NotificationPage(message: data),
        );

      default:
        return null;
    }
  }
}