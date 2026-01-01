#include <iostream>

using namespace std;

int main (){
	
	int size = 0; //malleable later
	cout << "Enter Size: ";
	cin >> size;
	
	int col = size/2;
	int row = 0;
	int i = 1;
	int arr[100][100] = {};
	int squaresize = size * size;
	
	while(i <= squaresize){
		
		
	if(arr[row][col] == 0){ //checking if value is not present
		arr[row][col] = i;
		row--;
		col++; //moves one up, one to the right
	} else {
		row++; //return to original pos
		col--; //return to original pos
		row++; //moves below
		arr[row][col] = i;
		row--;
		col++; //moves one up, one to the right
}
	
	if(row == -1 && col == size){
		row = 1;
		col = size - 1; //universal when it's at the corner
	}
		
	if(row == -1){
			row = size - 1; //sets the row back to the bottom
	}
		
	if(col == size){
		col = 0; //sets column back to the first
	}
		
	
		i++; //next number
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
	
