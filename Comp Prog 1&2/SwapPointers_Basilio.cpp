#include <iostream>
using namespace std;


int main() {
  int arrOne[] = {23, 21, 45, 16, 52};
  int arrTwo[] = {30, 28, 52, 23, 59};

  int sizeArrOne = sizeof(arrOne) / sizeof(int);
  int sizeArrTwo = sizeof(arrTwo) / sizeof(int);

  int* ptrArrOne = arrOne;
  int* ptrArrTwo = arrTwo;

 
  cout << "-------------" << endl;
  
  //it iterates through every element without modifying pointer
   cout << "Arr One:";
  for(int i = 0; i < sizeArrOne; i++){
  	if(i < sizeArrOne - 1){
  	cout << *(ptrArrOne + i) << ", ";
  } else {
  		cout << *(ptrArrOne + i) << endl;//to not append a "," at the end of the array
  }
  }
  
   cout << "Arr Two:";
  for(int i = 0; i < sizeArrTwo; i++){
  	if(i < sizeArrTwo - 1){
  	cout << *(ptrArrTwo + i) << ", ";
  } else {
  		cout << *(ptrArrTwo + i) << endl;
  }
  }
  cout << "-------------" << endl;
 

  cout << "-------------" << endl;
  cout << "Swapped Arrays:" << endl;
  cout << "-------------" << endl;

  // opting for sum method over temp var to use the two pointers alone
  for(int j = 0; j < sizeArrOne; j++){
  	*(ptrArrOne + j) = *(ptrArrOne + j) + *(ptrArrTwo + j); //stores sum of both
  	*(ptrArrTwo + j)= *(ptrArrOne + j) - *(ptrArrTwo + j); //gets value of ARrOne
  	*(ptrArrOne + j)-= *(ptrArrTwo + j); //since it stores the sum, subtract by arrtwo
  }
  
	//copy of the code for initial array
  cout << "Arr One:";
  for(int i = 0; i < sizeArrOne; i++){
  	if(i < sizeArrOne - 1){
  	cout << *(ptrArrOne + i) << ", ";
  } else {
  		cout << *(ptrArrOne + i) << endl;//to not append a "," at the end of the array
  }
  }
  
   cout << "Arr Two:";
  for(int i = 0; i < sizeArrTwo; i++){
  	if(i < sizeArrTwo - 1){
  	cout << *(ptrArrTwo + i) << ", ";
  } else {
  		cout << *(ptrArrTwo + i) << endl;
  }
  }
  cout << "-------------" << endl;
 

  return 0;
}

