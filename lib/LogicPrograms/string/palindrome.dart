/*String palindrome
*
* reverse String == original string
*
* in two pinter approach we can resolve
* 1.palindrome
* 2.reverse array
* 3.reverse String (refer reverse string file)
* 4.reverse Number
* */

main(){
  /*two pointer approach from ram */
  String str = 'madam';
  print(palindrome(str) ? 'palindrome' : 'not a palindrome');
  palinrome(str);
}

bool palindrome(String str) {
  int start = 0;
  int end = str.length-1;

  while(start < end) {
    if(str[start] != str[end]){
      return false;
    }
    start++;
    end--;
  }
  return true;
}

void palinrome(String str) {
  int start = 0;
  int end = str.length-1;

  while(start < end) {
    if(str[start] != str[end]){
      print('not a palin');
      return;
    }
    start++;
    end--;
  }
  print('palin');
}
