#include <iostream>
#include <string>
using namespace std;

// 4)	Then, convert your implementation into BNF (Backus-Naur Form) notation. 
// Your goal is to implement the grammar below that represents the structure of an arithmetic operations program.

// <expr>  -> <num> <opr> <num>
// <num>   -> <digit> | <digit><num>
// <digit> -> "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
// <opr>   -> "+" | "-" | "*" | "/"




// implementation of <digit> -> "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
bool parseDigit(char ch) {
    return ch >= '0' && ch <= '9';
}


// Implementation of <num>   -> <digit> | <digit><num>
bool parseNum(char ch) {
    return parseDigit(ch);
}


// Implementation of <opr>   -> "+" | "-" | "*" | "/"
bool parseOperator(char ch) {
    return ch == '+' || ch == '-' || ch == '*' || ch == '/';
}


// <expr>  -> <num> <opr> <num>
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

    cout << "[Backus Naur Validator for Arithmetic Expressions]" << endl;
    cout << "following this deriviation grammar: " << endl;
    cout << "<expr>  -> <num> <opr> <num>" << endl;
    cout << "<num>   -> <digit> | <digit><num>" << endl;
    cout << "<digit> -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9" << endl;
    cout << "<opr>   -> + | - | * | /" << endl;

    cout << endl;

    cout << "Enter an arithmetic expression: ";
    getline(cin, expression);

    //cleans the ecpression from spaces and stores it in newExpression
    string newExpression;

    for (char ch : expression) {
        if (ch != ' ') {
            newExpression += ch;
        }
    }

    cout << endl;
    cout << "Checking: " << newExpression << endl;

    if (parseExpression(newExpression)) {
        cout << "Valid expression according to given BNF grammar" << endl;
    } else {
        cout << "Invalid expression grammar according to the given BNF grammar" << endl;
    }

    return 0;
}