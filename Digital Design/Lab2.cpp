#include <stdio.h>
#include <ctype.h>

int binaryToOctal(int n){
	
	int octal; //stores octal
	int bitValue = 0; //stores  value
	int value = 0; //stores couples of 3 in binary
	int bitPos = 1; //stores position
	
	while (n >= 1){
		value = n % 1000;
		
		for(int i = 1; i < 8; i *= 2){
			if (value % 10 == 1){
				bitValue += i ;
			}
			value /= 10;
		}
		octal += bitValue * bitPos;
		bitPos *= 10; //tracks position of the next couple
		bitValue = 0;//resets bit value
		n /= 1000; //moves to the next couple
	}
	
	return octal;
}

int octalToBinary(int n){
	int binary; //stores binary
	int powerOfTwo = 1;//stores powers of two
	int bitValue = 1;//stores the position of couples of 3 
	int value = 0; //used to store couples of 3 in binary
	int tempvalue = 0; //used to calculate couples of 3 in binary
	int iteration = 1; //used to calculate where to append the couple of 3
	
	while(n >= 1){
		value = n % 10;
		while(value >= 1){
			if(value >= powerOfTwo){
				powerOfTwo *= 2; //goes to the next bit's power of two
				bitValue *= 10; //goes to the next bit's pow o two pos
			} else{
				tempvalue += (bitValue / 10);//goes to the previous bit value and add the highest possible power of two in binary
				value -= powerOfTwo / 2; //if not goes back to the last bit'as power of two
				powerOfTwo = 1;
				bitValue = 1;
			}
		}
		
		binary += tempvalue * iteration;
		iteration *= 1000;//next place
		tempvalue = 0;
		n /= 10; //moves to the next octal digit
	
	}
	return binary;
}

int main(){
	
	int choiceConvert;
	bool Rerun = true;
	char choiceRerun;
	int numberToConvert;
	int numberToCheck;
	int result;
	
	while(Rerun){
	
	printf("Which one would you like to Convert?\n");
	printf("1. Binary -> Octal\n");
	printf("2. Octal -> Binary\nchoice:");
	result = scanf("%d", &choiceConvert);
	getchar();
	
	if (result == 0){
		printf("Invalid Input, Enter Again: ");
		result = scanf("%d", &choiceConvert);
		while (getchar() != '\n');
	}
	
	switch(choiceConvert){
		
		case 1:
			
			printf("Enter a Binary Number: ");
			result = scanf("%d", &numberToConvert);
			
			if (result == 0){
				printf("Invalid Input, Enter Again: ");
				result = scanf("%d", &numberToConvert);
				while (getchar() != '\n');
			}
			
			
			getchar();
			numberToCheck = numberToConvert;
			
			while(numberToCheck > 0){
				
				if (numberToCheck % 10 == 1|| numberToCheck % 10 == 0){
					numberToCheck /= 10;
					continue;
				} 
				else
				{
					printf("Invalid Input,\nEnter a Binary Number: ");
					scanf("%d", &numberToConvert);
					getchar();
					numberToCheck = numberToConvert;
				}
			}
			printf("%d in octal is: %d\n",numberToConvert, binaryToOctal(numberToConvert) );
			break;
			
		case 2:
			
			printf("Enter an Octal Number: ");
			result = scanf("%d", &numberToConvert);
			
			if (result == 0){
				printf("Invalid Input, Enter Again: ");
				result = scanf("%d", &numberToConvert);
				while (getchar() != '\n');
			}
			
			
			
			getchar();
			numberToCheck = numberToConvert;
			
			while(numberToCheck > 0){				
				if ((numberToCheck % 10) <= 7){
					numberToCheck /= 10;
					continue;
				} 
				else
				{
					printf("Invalid Input,\nEnter an Octal Number: ");
					scanf("%d", &numberToConvert);
					getchar();
					numberToCheck = numberToConvert;
				}
			}
			
			printf("%d in binary is: %d\n",numberToConvert, octalToBinary(numberToConvert) );
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
		getchar();
	}
	
	if (toupper(choiceRerun) == 'N'){
		Rerun = false;
	}
	
}
}
