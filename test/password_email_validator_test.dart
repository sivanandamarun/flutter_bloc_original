import 'package:flutterBlocOriginal/pages/unittest/Myvalidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('email password validation', () {

    test('empty email test', () {
      //act
      String email = '';

      //act
      String result = MyValidator.emailValidator(email);
      //assert
      expect(result, 'Please Enter Email');
    });

    test('invalid email', () {
      String email = 'siv@h';
      //act
      String result = MyValidator.emailValidator(email);
      expect(result, 'Not valid Email');
    });

    test('valid email', () {
      String email = 'siv@g.com';
      //act
      String result = MyValidator.emailValidator(email);
      expect(result, 'valid Email');
    });

    test('not empty password', () {
      String password = '';
      //act
      String result = MyValidator.passwordValidator(password);
      expect(result, 'Please Enter Password');
    });

    test('not valid password', () {
      String password = 'siva';
      //act
      String result = MyValidator.passwordValidator(password);
      expect(result, 'Password must be more than 7 characters');
    });

    test('valid password', () {
      String password = 'sivanandam1000';
      //act
      String result = MyValidator.passwordValidator(password);
      expect(result, 'Valid password');
    });
  });

}