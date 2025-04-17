/*
* 1.find odd or even numbers
* 2.either range(from 1...100) or list of numbers [12,5,6,43,23,99,54] find sum of odd or even
*
*
*
* */

main() {
  List<int> numArray = [12, 5, 6, 43, 23, 99, 54];
  // sumOfOddNumberInGivenArray(numArray);
  int num = 100;
  sumOfOddNumberInGivenNumber(num);
}
sumOfOddNumberInGivenArray(List<int> numArray) {
  int oddSum = 0;
  int evenSum = 0;
  /*for (int i = 0; i < numArray.length; i++) {
    if (numArray[i] % 2 != 0) {
      oddSum += numArray[i];
    } else {
      evenSum += numArray[i];
    }
  }*/

  for(var num in numArray){
    numArray[num].isOdd ? oddSum += numArray[num] : evenSum += numArray[num];
  }
  print('The oddSum of odd number $oddSum');
  print('The evenSum of odd number $evenSum');
}

void sumOfOddNumberInGivenNumber(int num) {
  int oddSum = 0;
  int evenSum = 0;
  for(int i = 0 ; i <= 100 ; i++){
    i.isOdd ? oddSum += i : evenSum += i;
  }
  print('The oddSum of odd number $oddSum');
  print('The evenSum of odd number $evenSum');
}
