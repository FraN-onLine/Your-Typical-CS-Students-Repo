#include<iostream>

using namespace std;

struct Node {
	int data;
	Node* next; // will point to itself.
};

class LinkedList {
	Node* head;

	public:
		LinkedList() : head(NULL) {}

	void insertAtBeginning(int value) {
		Node* newNode = new Node(); // create or allocate memory for the node
		newNode->data = value;
		newNode->next = head;
		head = newNode;
	}

	void insertAtEnd(int value) {
		Node* newNode = new Node();
		newNode->data = value;
		newNode->next = NULL; // end of list

		if(!head) {
			head = newNode;
			return;
		}

		Node* temp = head;
		while(temp->next) { // until the next node == null
			temp = temp->next;
		}
		temp->next = newNode;
	}

	void insertAtPosition(int value, int position) { //counting from 0, pos 0 = first element

        Node* newNode = new Node();
		newNode->data = value;

        if (position == 0) {
				newNode->next = head;
				head = newNode;
				return;
			}

		Node* temp = head;
        int i = 0;

		while(temp && i < position - 1) {
			temp = temp->next; //goes to the element before that position
            i++;
		}

        if (!temp) {//out of bounds
				cout << "Invalid position" << endl;
				delete newNode;
				return;
		}



        newNode->next = temp->next; //attach newNode's next to the node before's position's next, (basta yun)
        temp->next = newNode; //erases node's link to it's former next and links to the new node

        
    }

	void deleteFromBeginning() {
        Node* temp = head;
        head = head->next;
        delete temp;
    }

   
	void deleteFromEnd() { //end nalang para consistent yung name 
		Node* temp = head;

    	if (!head->next) { // handles if the head is the only element
				delete head;
				head = NULL;
				return;
			}


		while(temp->next) { // until the next node == null
            if(temp->next->next){//checks if element is present two nexts after
			temp = temp->next;
            } else {
            delete temp->next;//else delete next
            temp->next = NULL;
            }
		}
		
    }
	
    void deleteFromPosition(int position) {
        Node* temp = head;
        int i = 0;

		while(temp && i < position - 1) {
			temp = temp->next;//goes to the element before that position
            i++;
		}

		if (!temp->next) {//out of bounds
			cout << "Invalid position" << endl;
			return;
		}

		Node* toDelete = temp->next;
        temp->next = temp->next->next;
		delete toDelete;
        
    }

	void display() {
		if(!head) {
			cout << "LinkedList is empty." << endl;
			return;
		}

		Node* temp = head;
		while(temp) {
			cout << temp->data << " -> ";
			temp = temp->next;
		}
		cout << "NULL" << endl;
	}

};

int main() {
	
	LinkedList list;
	list.insertAtBeginning(6);
	list.insertAtBeginning(12);
	list.insertAtBeginning(24);
	list.insertAtBeginning(48);
	list.insertAtEnd(3);
	list.insertAtEnd(69);
    //list by sir louis

    cout <<"Original:"<< endl;;
    list.display();

    list.insertAtPosition(3,2);//displays third since i opted to count from 0
    cout <<"Insert 3 at Third Position(\"Index\" 2): " << endl; //found out how to print quotes
    list.display();

    cout <<"Delete Beggining: " << endl;;
    list.deleteFromBeginning();//deletes 48, the one above now displays as the second one
	list.display();

    cout <<"Delete End: " <<endl;
    list.deleteFromEnd();//deletes 69
	list.display();

    cout <<"Delete at Second Position(\"Index\" 1): "<< endl;
    list.deleteFromPosition(1);//deletes second since i opted to count from 0
    list.display();

	return 0;
}