import 'package:flutter/cupertino.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/app_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> checkUserNamePassword(String userName, String password) async {
    emit(LoginLoadingState());
    if (userName == 'siva@g.com' && password == '123') {
      emit(LoginLoadedState());
      print('Logged in');
    } else {
      print('Not Logged in');
      emit(LoginLoadedErrorState());
    }
  }
}
