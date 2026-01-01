#include <iostream>
#include <stdio.h>
#include <cstring>
#include <ctype.h>

using namespace std;

int main (){
	
	char word[100];
	int j = 0;
	bool palindrome = true;
	
	cout << "Enter a String to check if it's a palindrome: ";
	gets(word);
	
	int length = strlen(word);
	
	for (int i = length - 1; i >= 0 && j < length; i--, j++) { 
        while (!isalnum(word[j])) j++;
        while (!isalnum(word[i])) i--;

		if ( j > length || i < 0) { break; }

        if (tolower(word[j]) != tolower(word[i])) {
            palindrome = false;
            break;
        }
    }

	
	if(palindrome){
		cout << word <<" is Thus a palindrome";
	} else {
		cout << word << " aint, therefore, Tis not a palindrome";
	}
}
