/*
*
* find the missing numbers in given array
*
* List<int> num = [1,2,3,5]
* ans = 4
*
* find actual sum  = 1+2+3+5 = 11
* find original sum = 1+2+3+4+5 = 16
*
* missing num is = 16-11 = 4;
*
*
* and also see two missing numbers
*
* */

main() {
  List<int> numArray = [1,2,9,5,8];
  numArray.sort();
  // findMissingNumberInArray(numArray);
  findMissingNumberInArraySecondApproach(numArray);
}
void findMissingNumberInArray(List<int> numArray) {
  int actualSum = 0;
  int originalSum = 0;
  for (var n in numArray){
    actualSum += n;
  }
  print('actualSum $actualSum');
  for(int i = 0 ; i <= numArray.last ; i++){
    originalSum += i;
  }
  print('originalSum $originalSum');


  int missingNumber = originalSum - actualSum;
  print('missingNumber $missingNumber');
}

void findMissingNumberInArraySecondApproach(List<int> numArray) {

  // 1.find first and last length to iterate.
  int first  = numArray.first;
  int last = numArray.last;

  // 2.convert array in to set to iterate and compare
  Set<int> numSet =  numArray.toSet();


  List<int> missingNumbers  = [
    for(int i = first ; i <= last ; i++) if(!numSet.contains(i)) i
  ];

  print('Missing numbers: $missingNumbers');
}