class MyValidator {
  static String emailValidator(final String input){
    String message ='';
    if(input.isEmpty){
      message = 'Please Enter Email';
    }
    final RegExp emailRegexp =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(input.trim().isNotEmpty && !emailRegexp.hasMatch(input)){
      message = 'Not valid Email';
    }

    if(emailRegexp.hasMatch(input)){
      message = 'valid Email';
    }
    return message;
  }


  static String passwordValidator(final String input){
    String message ='';
    if(input.isEmpty){
      message = 'Please Enter Password';
    }


    if(input.isNotEmpty && input.length <= 7){
      message = 'Password must be more than 7 characters';
    }

    if(input.isNotEmpty && input.length >= 7){
      message = 'Valid password';
    }
    return message;
  }
}