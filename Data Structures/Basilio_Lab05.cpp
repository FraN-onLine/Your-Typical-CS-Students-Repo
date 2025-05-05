#include <bits/stdc++.h>

using namespace std;

struct HashTable {
    int BUCKET; // size of hash table
    // create a vector of vectors
    // a vector within a vector that holds a pair of int, string pairs.
    vector<vector<pair<int, string>>> table; 

    HashTable(int b) {
        this->BUCKET = b;
        table.resize(BUCKET);
    }

    void insertItem(int key, string value) {
        int index = hashFunction(key);
        // create an address-of the table[index] and store it in p
        for (auto &p : table[index]) {
            if(p.first == key) {
                return;
            }
        }
        // if key does not exist, add the new pair
        table[index].emplace_back(key, value);
    }

    int hashFunction(int key) {
        return (key % BUCKET);
    }

    void displayHash();

    void deleteItem(int key);

    void searchItem(int key);
};

void HashTable::deleteItem(int key) {
    int index = hashFunction(key);

    for(auto it = table[index].begin(); it != table[index].end(); ++it) {
        if(it->first == key) {
            table[index].erase(it);
            return;
        }
    }
}

void HashTable::displayHash() {
    cout << "\nDisplaying Hash:" << endl;
    for(int i = 0; i < BUCKET; i++) {
        cout << i;
        for(const auto &p : table[i]) {
            cout << "-->" << p.first << ":" << p.second;
        }
        cout << endl;
    }
}

void HashTable::searchItem(int key){

    bool found = false;

    cout << "\nSearching Item " << key << ":" << endl;

    for(int i = 0; i < BUCKET; i++) { //same logic as display
        cout << i;
        for(const auto &p : table[i]) {

            if(p.first != key) //if the key of the item doesnt match the passed key, print it without modification, else add the parenthesis
            cout << "-->" << p.first << ":" << p.second;
            else{
            cout << "-->(" << p.first << ":" << p.second << ")"; 
            found = true;
            }
           
        }
        cout << endl;
    }
    if(!found) //display Key not found if passed key not in hashtable
    cout << "Key not found.";

}

int main() {
    vector<pair<int, string>> items = {
        {3894, "lowell"},
        {6218, "dwight"},
        {6337, "michaela"},
        {5679, "loi"},
        {9994, "abdul"},
        {6969, "pineda"},
        {1430, "aira"},
        {1232, "asiao"},
        {4444, "rajesh"}
    };
    HashTable h(10);
    for(const auto &item : items) {
        h.insertItem(item.first, item.second);
    }
    h.deleteItem(5679);
    h.displayHash();
    h.searchItem(9994);//abdul
    h.searchItem(6337);//michaela
    h.searchItem(8700);//Key not found
}