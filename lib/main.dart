import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/pages/LoginPage.dart';

import 'app_route.dart';

void main() {
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter? router;
  const MyApp({super.key, this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: router!.generateRoute,
    );
  }
}

