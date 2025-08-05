#include <stdio.h>
#include <ctype.h>
#include <windows.h>

int binaryToDecimal(int n){
	
	int decimal;
	int bitValue = 1;
	
	while(n >= 1){
		if (n % 10 == 1){
			decimal += bitValue;
		} 
		n /= 10;
		bitValue *=2;
	}
	return decimal;
}

int decimalToBinary(int n){
	int binary;
	int powerOfTwo = 1;
	int bitValue = 1;
	
	while(n >= 1){
		if(n >= powerOfTwo){
			powerOfTwo *= 2;
			bitValue *= 10;
		} else{
			binary += bitValue / 10;
			n -= powerOfTwo / 2;
			powerOfTwo = 1;
			bitValue = 1;
		}
	}
	return binary;
	
}



int main(){
	
	int choiceConvert;
	bool Rerun = true;
	char choiceRerun;
	int numberToConvert;
	int numberToCheck;
	
	while(Rerun){
	//system("cls");
	
	printf("Which one would you like to Convert?\n");
	printf("1. Binary -> Decimal\n");
	printf("2. Decimal -> Binary\nchoice:");
	scanf("%d", &choiceConvert);
	getchar();
	
	switch(choiceConvert){
		
		case 1:
			
			printf("Enter Binary Number: ");
			scanf("%d", &numberToConvert);
			getchar();
			numberToCheck = numberToConvert;
			
			while(numberToCheck > 0){
				
				if (numberToCheck % 10 == 1|| numberToCheck % 10 == 0){
					numberToCheck /= 10;
					continue;
				} 
				else
				{
					printf("Invalid Input,\nEnter Binary Number: ");
					scanf("%d", &numberToConvert);
					getchar();
					numberToCheck = numberToConvert;
				}
			}
			printf("%d in decimal is: %d\n",numberToConvert, binaryToDecimal(numberToConvert) );
			break;
			
		case 2:
			
			printf("Enter Decimal Number: ");
			scanf("%d", &numberToConvert);
			getchar();
			
			printf("%d in decimal is: %d\n",numberToConvert, decimalToBinary(numberToConvert) );
			break;
		
		default:
			printf("Invalid Choice");
			break;
	}
	
	getchar();
	
	printf("Would you like to run again? (Y/N)\nchoice:");
	scanf("%c", &choiceRerun);
	
	while(toupper(choiceRerun) != 'Y' && toupper(choiceRerun) != 'N' ){
		printf("Invalid input\n");
		printf("Would you like to run again? (Y/N)\nchoice:");
		scanf("%c", &choiceRerun);
	}
	
	if (toupper(choiceRerun) == 'N'){
		Rerun = false;
	}
	
}
}
