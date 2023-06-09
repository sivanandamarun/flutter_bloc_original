import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_original/cubit/login_cubit.dart';
import 'package:flutter_bloc_original/repository/app_repository.dart';

import 'pages/login_page.dart';
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