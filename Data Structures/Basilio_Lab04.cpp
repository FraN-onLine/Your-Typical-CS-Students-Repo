#include <iostream>
#include <string.h>

using namespace std;

struct Node {
    int data;
    Node* next;
};

class Stack {
    Node* top;

public:
    Stack() : top(nullptr) {}

    void push(int value) {
        Node* newNode = new Node();
        newNode->data = value;
        newNode->next = top;
        top = newNode;
    }

    int pop() {

        if (!top) {
            cout << "Stack is empty." << endl;
            return 0;
        }
        int toReturn = top->data;
        Node* temp = top;
        top = top->next;
        delete temp;
        return toReturn;
    }

    int peek() { //pointless na to
        if (top) {
            return top->data;
        }
        return '\0';
    }

    bool isEmpty() {
        return top == nullptr;
    }

    bool hasValues() {
        return top != nullptr && top->next != nullptr; // Check for at least two values
}

    bool isOperator(char c) {
        return c == '+' || c == '-' || c == '*' || c == '/';
    }

    int operate(int op1, int op2, char op){

        switch (op) {
            case '+': 
                return op1 + op2;
            case '-':
                return op1 - op2;
            case '*': 
                return op1 * op2;
            case '/':
                if (op2 != 0) return op1 / op2; // Prevent division by zero
                cout << "Division by zero error." << endl;
                return 0;
            default:
             return 0; // Handle any other cases
        }




    }

    void CalculatePostFix(string text) {

        int operand1;
        int operand2;

        if (text.empty() || text.find_first_not_of(' ') == string::npos ) { //basta space
        cout << "Invalid Input: Input is empty." << endl;
        return;
        }

        for (int i = 0; text[i] != '\0'; i++) {

            char ch = text[i];

            if (isdigit(ch)) {
                push(ch - '0'); //conversion using ASCII
            } else if (isOperator(ch)) {
                if (hasValues()) {
                    operand2 = pop();
                    operand1 = pop();
                    int result = operate(operand1, operand2, ch);
                    push(result);
                } else {
                    cout << "Invalid Input: Not enough operands." << endl;
                    return;
                }
            } else {
            cout << "Invalid Input: Character '" << ch << "' not recognized" << endl;
            return; // Invalid character
        }
        }

        if (isEmpty()) {
        cout << "Invalid Input: Stack is empty after evaluation." << endl;
        return;
    } else if (!isEmpty() && top->next != nullptr) {
        cout << "Invalid Input: Not enough Operators." << endl;
        return;
    }

        cout << "Result: " << pop() << endl; // Pop the final result

        return;
    }
    

    void display() {
        if (!top) {
            cout << "Stack is empty." << endl;
            return;
        }

        Node* temp = top;
        while (temp) {
            cout << temp->data << endl;
            temp = temp->next;
        }
    }
};

int main() {
    Stack s1;Stack s2;Stack s3;Stack s4;Stack s5;Stack s6;Stack s7;

    cout << "Test 1: "; s1.CalculatePostFix("67+"); //6 + 7 = 13
    cout << "\nTest 2: "; s2.CalculatePostFix("67+8"); //lacks operators
    cout << "\nTest 3: "; s3.CalculatePostFix("67+2*"); //(6 + 7) * 2 = 26
    cout << "\nTest 4: "; s4.CalculatePostFix("9+"); //lacks operands
    cout << "\nTest 5: "; s5.CalculatePostFix(" "); //its empty
    cout << "\nTest 6: "; s6.CalculatePostFix("67+2*2/5+"); //(((6 + 7) * 2 ) / 2 ) + 5 = 18
    cout << "\nTest 7: "; s7.CalculatePostFix("meow meow meow meow"); //states m not recognized
                                                                      //since its not an operand or operator
    return 0;
}