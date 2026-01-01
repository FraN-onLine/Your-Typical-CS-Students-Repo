#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main (){
	
	printf("\nSection 1.1 _____________________\n");
	int myNum_1 =0, myNum_2 =2, myNum_3 =3, myNum_4 = 4, myNum_5 =5;
	
	while(true){
		    // Convert the time to a string and print it
	system("cls");
	time_t currentTime;
    time(&currentTime);
    
    printf("Current time: %s", asctime(localtime(&currentTime)));
    
}
	
	printf("\nSection 1.2 _____________________\n");
	int myNum[5] = { 1,2,3,4,5};
	
	printf("%d\n",myNum[0]);
	printf("%d\n",myNum[1]);
	printf("%d\n",myNum[2]);
	printf("%d\n",myNum[3]);
	printf("%d\n",myNum[4]);
	
	printf("\nSection 1.3 _____________________\n");
	for(int i = 0; i < 5; i++){
		
	printf("%d\n",myNum[i]);
		
	}
	
	printf("\nSection 1.4 _____________________\n");
	int even = 0;
	
	for(int i = 0; i < 5; i++){
		
	even += 2;
	myNum[i] = even;
		
	}
	
		
	for(int j = 0; j < 5; j++){
		
	printf("%d\n",myNum[j]);
		
	}
	
	printf("\nSection 1.5 _____________________\n");
	//adjusted to long long because prior code results to a repeated digit if number exceeds 2,147,483,647 spite having ni repeated value, e.g. 9,807,654,321.
	long long int number[10];
	long long int n;
	bool repeat = false;
	long long int val;
	int size;
	
	printf("Enter a number to check(up to 10)");
	scanf("%lld",&n);
	
	for(int k = 0; k < 10; k++){
		
		val = n % 10;
		n /= 10;
		number[k] = val;
		if (n == 0){
			size = k + 1;
			break;
		}
		
	}

	for(int i = 0; i < size - 1; i++){
		
		for ( int j = size - 1; j > i; j--){ 
			
			if(number[i] == number[j]){
				repeat = true;
				break;
			}
			
		}
		
		if (repeat){
			break;
		}
		
	}
	
	if(repeat == true){
		printf("There is a digit repeated in the number");
	} else {
		printf("There is NO digit repeated in the number");
	}
	
}
