#include <iostream>

using namespace std;

int main (){
	
	int size = 0; //malleable later
	cout << "Enter Size: ";
	cin >> size;
	
	int col = size/2;
	int row = 0;
	int i = 1;
	int arr[50][50] = {};
	int squaresize = size * size;
	
	while(i <= squaresize){
		
		
	if(arr[row][col] == 0){
		arr[row][col] = i;
		row--;
		col++;
	} else {
		row++;
		col--;
		row++;
		arr[row][col] = i;
		row--;
		col++;
}
	
	if(row == -1 && col == size){
		row = 1;
		col = size - 1;
	}
		
	if(row == -1){
			row = size - 1;
	}
		
	if(col == size){
		col = 0;
	}
		
	
		i++;
	}
	
	int sum = 0;
	
	for(int k = 0; k < size; k++ ){
		sum = 0;
		for(int j = 0; j < size; j++ ){
			sum += arr[k][j];
			cout << arr[k][j] << "\t";
			if (j == size - 1){
				cout << " = " << sum << endl;
			}
	}
	
	}
	
	for(int k = 0; k < size; k++ ){
		sum = 0;
		for(int j = 0; j < size; j++ ){
			sum += arr[j][k];
			if(j == size - 1){
				cout << sum << "\t";
			}
		}
	}
	
	sum = 0;
	int j;
	for(int k = 0; k < size; k++ ){
	 j = k;
	sum += arr[k][j];
	if(k == size - 1){
		cout << " = " << sum << "\t";
		}
	
}
	
	
	

	
	
/*int sum = 0;
	for(int k = 0; k < size; k++ ){
		sum = 0; 
		for(int j = 0; j < size; j++ ){
			sum += arr[k][j];
			if(j == size - 1){
				cout << "Sum of Row " << k+1 << " is " << sum << endl;
			}
		}
	}
	
	for(int k = 0; k < size; k++ ){
		sum = 0;
		for(int j = 0; j < size; j++ ){
			sum += arr[j][k];
			if(j == size - 1){
				cout << "Sum of Column " << k+1 << " is " << sum << endl;
			}
		}
	}
	
	sum = 0;
	int j;
	for(int k = 0; k < size; k++ ){
	 j = k;
	sum += arr[k][j];
	if(k == size - 1){
		cout << "Sum of Diagonal is " << sum << endl;
		}
	}

	*/
	
}
	
