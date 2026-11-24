#include <iostream>
using namespace std;

int globalVar = 100; //accessile anywhere

int function() {
    int localVar = 10; //accessible only within this function
    cout << "\nInside the function:" << endl;
    cout << "Global variable: " << globalVar << endl;
    cout << "Local variable: " << localVar << endl;

    if (true) { 
        //inside block
        int blockVar = 1;

        cout << "\nInside the nested block and within function:" << endl;
        cout << "Global variable: " << globalVar << endl;
        cout << "Local variable: " << localVar << endl;
        cout << "Block variable: " << blockVar << endl;
    }
    return 0;
}

int main() {

    cout << "Outside the nested block, before function call:" << endl;
    cout << "Global variable: " << globalVar << endl;

    function();

    cout << "\nOutside the nested block, after function call:" << endl;
    cout << "Global variable: " << globalVar << endl;

    return 0;
}
