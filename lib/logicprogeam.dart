main(){
  String str = 'madam';
  // checkPalindrome(str);

  //input  = 'aabbcdfggiiim'
  //output = a2b2c1d1f1g2i3m1
  // String sample= 'aabbcdfggiiim';
  // countCharacters(sample);

  //2nd largest in given array
  List<int> sampleList = [6,10,35,21,98,21,44];
  secondLargestInGivenArray(sampleList);
}


void checkPalindrome(String str){
  String reversed='';
  for(int i = str.length-1; i >= 0;i--){
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


