import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterBlocOriginal/cubit/login_cubit.dart';
import 'package:flutterBlocOriginal/repository/app_repository.dart';

import 'pages/LoginPage.dart';
class AppRouter {
AppRepository repository = AppRepository();

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/" :
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>(
              create: (_) => LoginCubit(),
              child: Login(),
            )
        );

      default:
        return null;
    }
  }
}