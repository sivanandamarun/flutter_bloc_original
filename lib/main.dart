import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/pages/LoginPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Firebase/FirebaseAPI.dart';
import 'app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey< NavigatorState>();
void main() async {
  const supabaseUrl = 'https://cjzgjwfztsgukvkpuaxs.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAPI().initNotification();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
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
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: router!.generateRoute,
    );
  }
}

