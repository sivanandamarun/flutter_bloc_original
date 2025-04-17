/*
* find the count of each character in a given string
* and print which character count is grater than other character.
*
*
* 2.find the max occurence of words
* Eg : big black bug bit a big dog on his big black nos
* ans = big = 3;
*
*
* Eg : sivanandam -  print a = 3
* */


/*
* Assignment to do
* 1.create model class (productId,productName, category)
* 2.create a list of data for model (Product is a class name eg productId = 101, productName = apple,category = fruits),
* (eg productId = 102, productName = orange,category = fruits)
* (eg productId = 103, productName = carrot,category = vegetable)
*
* 3.group by category (List<fruits> , List<Vegetables> and ect...) // excepted out put
*
* Map<String,List<products>>
*
* */


main(){
  String str = 'sivanandam';
  String strSentence = 'big black bug bit a big dog on his big black nos';
  // findGreatestCharacterCount(str);
  findMaxOccurrenceWords(strSentence);
}

void findGreatestCharacterCount(String str) {
  // 1. Create a map to add key and value (key = character , value = count)
  Map<String,int> strMap = {};
  // 2. Iterate a loop to count the character count and add them in the map

  for(int i = 0 ; i < str.length ; i++ ) {
    // check the character already in the map
    // if there get the count
    // if not there null will return the add zero count to that character
    // (E.g) initial map is empty check char S is there
    // so S is not in the map so the initial count is 0
    // then increase the count (0+1) so = 1
    int count  = strMap[str[i]] ?? 0;
    strMap[str[i]] = count + 1;
  }
  String? maxKey;
  int? maxValue;
  strMap.forEach((key,value) {
    if(maxKey == null || value > maxValue!){
      maxKey = key;
      maxValue = value;
    }
  });

  print(maxKey);
  print(strMap[maxKey]);
}

void findMaxOccurrenceWords(String strSentence){

  List<String> strlist = strSentence.split(' ');
  Map<String,int> strMap ={};

  for(int i = 0 ; i < strlist.length;i++){
    int count = strMap[strlist[i]] ?? 0;
    strMap[strlist[i]] = count + 1;
  }

  String? maxKey;
  int? maxValue;
  strMap.forEach((key,value) {
    if(maxKey == null || value > maxValue!){
      maxKey = key;
      maxValue = value;
    }
  });

  print(maxKey);
  print(strMap[maxKey]);
}