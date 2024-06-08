main() {
  // String str = 'madam';
  // checkPalindrome(str);
  int num  = -123;
  print(num.abs());

  //input  = 'aabbcdfggiiim'
  //output = a2b2c1d1f1g2i3m1
  // String sample= 'aabbcdfggiiim';
  // countCharacters(sample);

  //2nd largest in given array
  // List<int> sampleList = [6, 10, 35, 21, 98, 21, 44];
  // secondLargestInGivenArray(sampleList);

  // List<int> nums = [1, 2, 3, 5, 6, 8, 9];
  // List<int> sizeList = [1,2,3,5,6,8,7,8];

  /**
   * [1,2,3,5,6,8,7,8];
   * (1,2),(2,3), (5,6),(8) (7,8) = 5 pairs
   */
  // checkTheMatchingSizePairs(sizeList);

  /**
   * check given number is palindrome or not
   */

   // checkGivenNumberIsPalindromeOrNot(1221);
}

void checkTheMatchingSizePairs(List<int> sizeList) {
  int count = 0;
  for(int i = 0 ; i < sizeList.length-1; i++){
    if(sizeList[i] + 1 == sizeList[i+1]){
      count++;
    }
  }
  print(count);
}


void checkPalindrome(String str){
  String reversed='';
  for(int i = str.length -1 ; i >= 0;i--){
    print(i);
    reversed = '$reversed${str[i]}' ;
  }
  if(str == reversed){
      print('palindrome');
  }else{
      print(' not palindrome');
  }
}

void countCharacters(String str){
  // 0 = a
  //0+1 = a
  int count = 1;
  for(int i = 0 ; i < str.length ; i++){
    if( (i+1 < str.length) && (str[i] == str[i+ 1] ) ){
      count ++;
    }else{
      print('${str[i]} $count');
      count = 1;
    }
  }
}

void secondLargestInGivenArray(List<int> sampleArray) {
  int max1 = sampleArray[0];
  int max2 = sampleArray[0];
  int max3 = sampleArray[0];

  for(int i = 1 ; i < sampleArray.length ; i++ ){
    if(sampleArray[i] > max1){
      max3 = max2;
      max2 = max1;
      max1 = sampleArray[i];
    }else if(sampleArray[i] > max2 && max1!= sampleArray[i]){
      max3=max2;
      max2 = sampleArray[i];
    }
  }

  print(' The largest number is $max1');
  print(' The Second largest number is $max2');
  print(' The Third largest number is $max3');
}

checkGivenNumberIsPalindromeOrNot(int num){

  // need to reverse the number
  // int numberToReverse = 353;
  int reversedNumber = 0;
  int beforeReverse = num;
  while (num > 0) {
    int reminder = num % 10;
    reversedNumber = (reversedNumber * 10) + reminder;
    num = (num / 10).toInt();
  }
  if (beforeReverse == reversedNumber) {
    print("Number is Palindrome");
  } else {
    print("Number is not Palindrome");
  }

  print('The reverse number is $num');

}

/**
 * List duplicate find logic
 */
/*List<int> dup = [1,2,3,4,4,5,8];

  List<String> dupstr = ['sample','2','3','4','4','sample','8'];
  List<String> orgi=[];

  String abc = "ababcmycfiyjkllttreec";

  orgi = dupstr.toSet().toList();

  for(int i = 0 ; i < abc.length; i++){
    for(int j = i+1 ; j < abc.length; j++){
       if(abc[i] == abc[j]){
         if(!orgi.contains(abc[i])){
            orgi.add(abc[i]);

         }
       }

    }
  }
  print(orgi);*/


/**
 * swap numbers logic with out and with temp
 */
/*int a = 34;
  int b = 43;
  int c = 77;
  int temp;
  temp = c;  // temp = 77
  c =  b; // c = 43
  b = a ; // b = 34
  a = temp; // a = 77

    int c = b;
    b = a;
    a = c;


     int c = 57;
    int d = 22;
    int c = 60;

    a = a + b; //10 + 20 = 30;
    b = a - b; // 30 -  20 = 10;
    a = a - b; //30 - 10 = 20

    a = a + b + c + d; // 60
    b = a - ( b + c + d);
    c = a - ( b + c + d);
    d = a - ( b + c + d);
    a = a - ( b + c + d);




  print('Sawpped values $a $b $c');*/




