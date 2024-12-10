/*
* find the count of each character in a given string
* and print which character count is grater than other character.
*
* Eg : sivanandam -  print a = 3
* */


main(){
  String str = 'sivanandam';
  findGreatestCharacterCount(str);
}

void findGreatestCharacterCount(String str) {
  Map<String,int> strMap = {};
  for(int i = 0 ; i < str.length ; i++ ) {
    int count  = strMap[str[i]] ?? 0;
    strMap[str[i]] = count + 1;
  }
  String? maxKey;
  int? maxValue;
  strMap.forEach((key,value) {
    if(maxKey == null || value > maxValue! ){
      maxKey = key;
      maxValue = value;
    }
  });

  print(maxKey);
  print(strMap[maxKey]);
}