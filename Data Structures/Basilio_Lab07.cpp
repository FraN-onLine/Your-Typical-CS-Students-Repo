#include <iostream>

using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    int count;

    Node(int value) : data(value), left(nullptr), right(nullptr), count(1) {} //count will be 1 in every new node cause will be the first
};

class BST {
private:
    Node* root;

    Node* insert(Node* node, int value) {
        if (node == nullptr) {
            return new Node(value);
        }
        if (value < node->data) {
            node->left = insert(node->left, value);
        } else if (value > node->data) {
            node->right = insert(node->right, value);
        } else if(value == node->data){
            node->count++; // Increment count if the data already exists
        }
        return node; //this will return the original node back if its not a nullptr, returns rootnode back to root etc.
    }

    bool search(Node* node, int value) const {
        if (node == nullptr){
            return false;
        }
        if (value == node->data){
            return true;
        }
        else if (value < node->data){
            return search(node->left, value);
        }
        else {
            return search(node->right, value);
        }
    }

    
    //i believe these makes use of call stack to work as intended, just reorder the functions
    void inOrder(Node* node) {
        if (node != nullptr) {
            inOrder(node->left);
            displaydata(node);
            inOrder(node->right);
        }
    }

    void preOrder(Node* node) {
        if (node != nullptr) {
            displaydata(node);
            preOrder(node->left);
            preOrder(node->right);
        }
    }

    
    void postOrder(Node* node) {
        if (node != nullptr) {
            postOrder(node->left);
            postOrder(node->right);
            displaydata(node);
        }
    }

    void displaydata(Node* node) {
        if (node->count > 1) {
            cout << "(" << node->data << "-" << node->count << ") ";
        } else {
            cout << "(" << node->data << ") ";
        }
    }

public:
    BST() : root(nullptr) {}
 
    void insert(int data) {
        root = insert(root, data);
        //cout << "Inserted " << data << endl;
    }

    bool search(int data) const{
        return search(root, data);
    }
    void inOrderTraversal() {
        cout << "In-order: ";
        inOrder(root);
        cout << endl;
    }

    void preOrderTraversal() {
        cout << "Pre-order: ";
        preOrder(root);
        cout << endl;
    }

    void postOrderTraversal() {
        cout << "Post-order: ";
        postOrder(root);
        cout << endl;
    }
};


int main() {
    BST tree;

    tree.insert(25);
    tree.insert(13);
    tree.insert(37);
    tree.insert(13); // Duplicate
    tree.insert(8);
    tree.insert(25); // Duplicate
    tree.insert(39);
    tree.insert(69);
    tree.insert(8700);
    tree.insert(25);
    tree.insert(17);
    tree.insert(38);

    tree.inOrderTraversal();
    tree.preOrderTraversal();
    tree.postOrderTraversal();

    return 0;
}
