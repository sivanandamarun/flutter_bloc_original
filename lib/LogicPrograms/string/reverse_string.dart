/*String reverse
*
* EG : siva  = avis
*
* in two pinter approach we can resolve
* 1.palindrome
* 2.reverse array
* 3.reverse String (refer reverse string file)
* 4.reverse Number
*
* */
main(){
  String str = 'sivanandam';
  // stringReverse(str);
  // reverseString(str);
  //two pointer approach from ram
  twoPointerApproach(str);
}

void twoPointerApproach(String str) {

  int start = 0;
  int end  = str.length - 1;

  List<String> stringList = str.split(''); // reverse array

  // String num = 123456.toString(); // number reverse



  while(start < end ){
    String temp = stringList[start];
    stringList[start] = stringList[end];
    stringList[end] = temp;
    start++;
    end--;
  }

  print(stringList.join(''));

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