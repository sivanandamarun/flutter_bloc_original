part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {

  LoginInitialState();
}

class LoginLoadingState extends LoginState{


  @override
  List<Object> get props => [];

  LoginLoadingState();
}


class LoginLoadedState extends LoginState{

  @override
  List<Object> get props => [];

  LoginLoadedState();
}

class LoginLoadedErrorState extends LoginState{

  @override
  List<Object> get props => [];

  LoginLoadedErrorState();
}
