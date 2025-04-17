/*
* remove the duplicate character in a given string
* Eg. programming -> progamin
*
* */

main() {
  String str = 'sivanandam';
  // Set<String> setStr = str.split('').toSet();
  // String afterRemovedString = setStr.join('');
  // print(afterRemovedString);

  //using loop
  String resultStr = '';
  for (int i = 0; i < str.split('').length; i++) {
    if (!resultStr.contains(str[i])) {
      resultStr += str[i];
    }
  }
  print(resultStr);
}
