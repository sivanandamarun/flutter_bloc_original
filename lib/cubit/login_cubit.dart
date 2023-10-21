import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/app_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> checkUserNamePassword(String userName, String password) async {
    try {
      emit(LoginLoadingState());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userName, password: password)
          .then((value) {
        emit(LoginLoadedState());
      }).onError((error, stackTrace) {
        emit(LoginLoadedErrorState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginLoadedErrorState());
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginLoadedErrorState());
        print('Wrong password provided for that user.');
      }
    }

    /*if (userName == 'siva@g.com' && password == '123') {
      emit(LoginLoadedState());
      print('Logged in');
    } else {
      print('Not Logged in');
      emit(LoginLoadedErrorState());
    }*/
  }
}
