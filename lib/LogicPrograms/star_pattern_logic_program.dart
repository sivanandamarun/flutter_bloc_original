import 'dart:io';

void main() {

  /**
   *  Patterns ( always in nested loop ).
   *  Steps to identify the patterns program logic.
   *  1) outer loop - count the number of line.
   *  2) inner loop - count the columns & count them somehow to the rows.
   *  3) print in inner loop.
   *  4) print new line in outer loop.
   * */


  int n = 4;
//  j  0 1 2 3 4 = i
//  j=1 * * * * * = i1
//  j=2 * * * * * = i2
//  j=3 * * * * * = i3
//  j=4 * * * * * = i4
//  j=5 * * * * * = i5
//   pattern1(n);

// *
// * *
// * * *
// * * * *

  /**
   *  1) 4 lines so outer loop up to 4
   *  2) for j = 0 -> 1 star so its 0 to 1 so j <= i logic will need to put in inner loop
   *     for j = 1 -> 2 stars
   *     for j = 2 -> 3 stars
   *  3) then print the star in inner loop.
   *  4) print new line in outer loop.
   * */
  // pattern2(n);

  // 1
  // 1 2
  // 1 2 3
  // pattern3(n);

  // 1
  // 2 2
  // 3 3 3
  // patter4(n);

  // * * *
  // * *
  // *
  // patter5(n);



  // n =4
  //      *       inner loop [space(3), star(1),space(3)] [ n-i-1 , 2*i+1 , n-i-1 ] [4-0-1 = 3 , 2*0+1 = 1, 4-0-1 = 3]
  //     ***      [2,3,2] [ n-i-1 , 2*i+1 , n-i-1 ] [4-1-1 = 2, 2*1+1 = 3 , 4-1-1 = 2]
  //    *****     [1,5,1]
  //   *******    [0,7,0]

  /* so we have 3 inner loop to achieve the this pattern */
  // patter6(n);

  //            *
  //          * *
  //        * * *
  //      * * * *
  //    * * * * *
  // pattern7(n);


  pattern8(n);
  // pattern7(n);
}


void pattern1(int n) {
  // int  n = 5;

  //row
  for (int i = 0; i < n; i++) {
    //column
    for (int j = 0; j < n; j++) {
      stdout.write('*');
    }
    //move to next line
    print('');
  }
}

void pattern2(int n) {
  for (int i = 0; i <= n; i++) {
    for (int j = 0; j <= i; j++) {
      stdout.write('* ');
    }
    print('');
  }
}

void pattern3(int n) {
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('$j');
    }
    print('');
  }
}

void patter4(int n){
  for(int i = 1 ; i <=n; i++) {
    for (int j = 1 ; j <=i; j++){
      stdout.write('$i');
    }
    print('');
  }
}

void patter5(int n) {
  /*for(int i = 1 ; i < n ; i++){
    for (int j = 0 ; j < n-i+1 ; j++){
      stdout.write('* ');
    }
    print('');
  }*/


  for(int i = 1 ; i < n ; i++){
    for (int j = i ; j < n ; j++){
      stdout.write('* ');
    }
    print('');
  }
}

void patter6(int n) {

  /*for(int i =0 ; i < n; i++){
    // space
    for(int j = 0 ; j < n-i-1; j++ ){
      stdout.write(' ');
    }

    // star
    for(int j = 0 ; j < 2*i+1; j++ ){
      stdout.write('*');
    }

    // space
    for(int j = 0 ; j < n-i-1; j++ ){
      stdout.write(' ');
    }
    print('');
  }*/

  for(int i = 0 ; i < n; i++){
    // space
    for(int j = i ; j < n-1; j++ ){
      stdout.write('-');
    }

    // star
    for(int j = 0 ; j < (2*i) + 1 ; j++ ){
      stdout.write('*');
    }

    // space
    for(int j = i ; j < n-1; j++ ){
      stdout.write('-');
    }
    print('');
  }

}

void pattern7(int n) {
  for(int i = 0 ; i < n; i++){
    //space
    for(int j = i ; j < n ; j++ ){
      stdout.write('-');
    }

    for(int k = 0 ; k <= i; k++){
      stdout.write('*');
    }
    print('');
  }
}


void pattern8(int n){
  int i,j;
  /*for (i = 0; i < n; i++) {

    for (j = n - i; j > 1; j--) {
      stdout.write("-");
    }

    // inner loop to print stars.
    for (j = 0; j <= i; j++) {
      stdout.write("* ");
    }
    // printing new line for each row
   print('');
  }*/

  for (i = 0; i < n; i++) {
    for (j = i ; j < n-1 ; j++) {
      stdout.write("-");
    }
    for (j = 0; j <= i; j++) {
      stdout.write("* ");
    }
    print('');
  }
}

