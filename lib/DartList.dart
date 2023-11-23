main(){
  /**
   * List have two types
      1.fixed length list
      2.growable list
    */


  // Fixed length list declaration

  List<int> fixedLengthList = List<int>.filled(10, 0);

  // based on the growable fixed or not fixed
  List<int> fixedLengthList1 = List<int>.empty(growable: true);
  fixedLengthList1.add(1);
  printListElements(fixedLengthList1);

  //String list Example
  /*List<String> sampleStr = List<String>.filled(2, '0');
  sampleStr.forEach((element) {
    print(element);
  });*/
  /**
   * convert String to list
   */
  String name = 'Sivanandam';
  List<String> namesList = name.split('');
   // print(namesList);

  /**
   * List index methods
   */
  List<int> sampleIntList = [1,3,5,7,8,9,];
                         // [0,1,2,3,4,5]
  sampleIntList.add(1);
  // [6]
  sampleIntList.add(15);
  // [7]
  sampleIntList.add(18);
  // [8]
  print(sampleIntList);
  //if the element is not there it will return -1
  print('The index of given element is ${sampleIntList.indexOf(89)}');
  print('The index of given element is ${sampleIntList.indexOf(8)}');
  print('The last index of given element is ${sampleIntList.lastIndexOf(1)}');


}

void printListElements(List<int> samplelist){
  for(int element in samplelist){
    print(element);
  }
}