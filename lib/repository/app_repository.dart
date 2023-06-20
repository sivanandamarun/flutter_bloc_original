class AppRepository {
  AppRepository(): super();

  Future<bool> checkUserNamePassword(String userName, String password) {
    if (userName == 'siva' && password == '123') {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }




}
