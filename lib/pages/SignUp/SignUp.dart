import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/pages/LoginPage.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController userNameController =
      TextEditingController(text: 'sivanandam1000@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'welcome');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'passwordController',
                    hintText: 'Enter secure passwordController'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  try {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: userNameController.text,
                            password: passwordController.text)
                        .then((value) {
                      Navigator.of(context).pushNamed('/');
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      if (kDebugMode) {
                        print('The account already exists for that email.');
                      }
                    }
                  }
                },
                child: const Text(
                  'Sign',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
