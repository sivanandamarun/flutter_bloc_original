/*String reverse
*
* EG : siva  = avis
* */
main(){
  String str = 'sivanandam';
  stringReverse(str);
  reverseString(str);
}



void stringReverse(String str) {
  String reverseString = '';
  for(int i = str.length - 1 ; i >= 0 ; i--){
    reverseString = reverseString +str[i];
  }
  print(reverseString);
}

void reverseString(String str) {
  String reversed = str.split('').reversed.join();
  print(reversed);
}