#include <iostream>
using namespace std;

int main() {
    double num1, num2;
    char op;

    cout << "[Simple Arithmetic Program]" << endl;

    //defined validation will be added atBNF part 2
    cout << "Enter first number: ";
    cin >> num1;

    cout << "Enter operator (+, -, *, /): ";
    cin >> op;

    cout << "Enter second number: ";
    cin >> num2;

    //return result based on operator
    switch (op) {
        case '+':
            cout << num1 << " + " << num2 << " = " << num1 + num2 << endl;
            break;

        case '-':
            cout << num1 << " - " << num2 << " = " << num1 - num2 << endl;
            break;

        case '*':
            cout << num1 << " * " << num2 << " = " << num1 * num2 << endl;
            break;

        case '/':
            if (num2 != 0)
                cout << num1 << " / " << num2 << " = " << num1 / num2 << endl;
            else
                cout << "Error: Cannot divide by zero." << endl;
            break;

        default:
            cout << "Invalid operator." << endl;
    }

    return 0;
}

#include <iostream>
#include <string>
using namespace std;

// <expr>  -> <num> <opr> <num>
// <num>   -> <digit> | <digit><num>
// <digit> -> "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
// <opr>   -> "+" | "-" | "*" | "/"


// Implementation of <digit>
bool parseDigit(char ch) {
    return ch >= '0' && ch <= '9';
}


// Implementation of <num>
bool parseNum(char ch) {
    return parseDigit(ch);
}


// Implementation of <opr>
bool parseOperator(char ch) {
    return ch == '+' || ch == '-' || ch == '*' || ch == '/';
}


// Implementation of <expr>
bool parseExpression(string text) {
    int pos = 0;

    if (text.empty()) {
        return false;
    }

    // <num>
    if (!parseNum(text[pos])) {
        return false;
    }

    while (pos < text.length() && parseNum(text[pos])) {
        pos++;
    }

    // <opr>
    if (pos >= text.length() || !parseOperator(text[pos])) {
        return false;
    }

    pos++;

    // <num>
    if (pos >= text.length() || !parseNum(text[pos])) {
        return false;
    }

    while (pos < text.length() && parseNum(text[pos])) {
        pos++;
    }

    // Make sure the whole expression follows the grammar
    return pos == text.length();
}


int main() {
    string expression;

    cout << "====================================" << endl;
    cout << "      BNF ARITHMETIC VALIDATOR      " << endl;
    cout << "====================================" << endl;

    cout << "Grammar: <num> <opr> <num>" << endl;
    cout << "Operators: +  -  *  /" << endl;
    cout << endl;

    cout << "Enter an arithmetic expression: ";
    getline(cin, expression);

    // Remove spaces
    string cleanedExpression;

    for (char ch : expression) {
        if (ch != ' ') {
            cleanedExpression += ch;
        }
    }

    cout << endl;
    cout << "Checking: " << cleanedExpression << endl;

    if (parseExpression(cleanedExpression)) {
        cout << "Result: VALID EXPRESSION" << endl;
    } else {
        cout << "Result: INVALID EXPRESSION" << endl;
    }

    return 0;
}