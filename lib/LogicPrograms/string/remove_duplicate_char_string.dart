/*
* remove the duplicate characters in a given string
* Eg : programming =   print progaming
* */


main(){
  String str = 'programming';
 removeDuplicateCharacter(str);

 // using index method
  removeDup(str);
}

void removeDup(String str) {
  String original ='';
  for(int i = 0 ; i < str.length ; i++){
    if(str.indexOf(str[i]) == i){
      original = original + str[i];
    }
  }

  print(original);
}

void removeDuplicateCharacter(String str) {
  Set<String> setString = Set<String>.from(str.split(''));
  String original = setString.toList().join('');
  print(original);
}