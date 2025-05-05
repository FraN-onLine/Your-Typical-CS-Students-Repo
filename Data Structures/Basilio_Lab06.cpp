#include <bits/stdc++.h>
#include <cmath> 

using namespace std;

struct HashTable {
    int BUCKET; // size of hash table
    vector<vector<pair<string, string>>> table;

    HashTable(int b) {
        this->BUCKET = b;
        table.resize(BUCKET);
    }

    void insertItem(string key, string value);
    int convertKey(string key);
    int hashFunction(int key);
    void displayHash();
    void deleteItem(string key);
    void searchItem(string key);
};

void HashTable::insertItem(string key, string value) {
    if (key.length() > 5) {
        cout << "Error: Key should not have more than 5 characters\n";
        return;
    }

    int newKey = convertKey(key);
    int index = hashFunction(newKey);

    // Check if the key already exists
    for (auto &p : table[index]) {
        if (p.first == key) {
            cout << "Key " << key << " already exists. Skipping insert.\n";
            return;
        }
    }

    // Add the new pair if key does not exist
    table[index].emplace_back(key, value);
}

int HashTable::convertKey(string key) {
    int k = 0;
    for (int i = 0; i < key.length(); i++) {
        k += int(key[i]);
    }
    return k;
}

int HashTable::hashFunction(int key) {
    const double A = 0.6180339887; // Fractional constant
    int index = int(BUCKET * fmod(key * A, 1));
    return index;
}

void HashTable::deleteItem(string key) {
    int newKey = convertKey(key);
    int index = hashFunction(newKey);

    for (auto it = table[index].begin(); it != table[index].end(); ++it) {
        if (it->first == key) {
            table[index].erase(it);
            cout << "Deleted key " << key << "\n";
            return;
        }
    }
    cout << "Error: Key " << key << " not found.\n";
}

void HashTable::displayHash() {
    cout << "\nDisplaying Hash Table:\n";
    for (int i = 0; i < BUCKET; i++) {
        cout << i;
        for (const auto &p : table[i]) {
            cout << " --> " << p.first << ":" << p.second;
        }
        cout << endl;
    }
}

void HashTable::searchItem(string key) {

    if (key.length() > 5) {
        cout << "Error: Key should not have more than 5 characters" << endl;
        return;
    }


   bool found = false;

    int newKey = convertKey(key);
    int index = hashFunction(newKey);

    for(auto it = table[index].begin(); it != table[index].end(); ++it) {
        if(it->first == key) {
        found = true;
        break;
    }
    }

    if(!found){
        cout << "Error: Key " << key << " not found" << endl;
        return;
    }


    cout << "\nSearching Item " << key << ":" << endl;

 for (int i = 0; i < BUCKET; i++) {
        cout << i;
        for (const auto &p : table[i]) {
            if(p.first != key) //if the key of the item doesnt match the passed key, print it without modification, else add the parenthesis
            cout << "-->" << p.first << ":" << p.second;
            else{
            cout << "-->(" << p.first << ":" << p.second << ")";
            found = true;
            }
        }   
         cout << endl;
    }
}


int main() {

  vector<pair<string, string>> items = {
    {"louis", "lsvelasco@gmail.com"},
    {"abdul", "abababababdul@gmail.com"},
    {"mango", "mango@gmail.com"},
    {"apple", "apple@example.com"},
    {"peach", "peach123@yahoo.com"},
    {"grape", "grape_lover@outlook.com"},
    {"chloe", "chloe89@aol.com"},
    {"alex", "alex_smith@domain.com"},
    {"piano", "piano_player@mail.com"},
    {"giddy", "giddyup@gmail.com"},
    {"fancy", "fancy_style@webmail.com"},
    {"frank", "franklin1234@aol.com"},
    {"susan", "susan.jones@mail.com"},
    {"karen", "karen321@domain.com"},
    {"oliva", "olivia_walker@webmail.com"},
    {"david", "david2024@gmail.com"},
    {"peter", "peter_parker@yahoo.com"},
    {"rajes", "eahsuieajs@outlook.com"},
    {"james", "james_bond@aol.com"},
    {"sarah", "sarah.hale@mail.com"},
    {"kevin", "kevin_hero@domain.com"},
    {"tiger", "tigerking@webmail.com"},
    {"venus", "venus_astro@aol.com"},
    {"diana", "diana_taylor@mail.com"},
    {"jason", "jason.brown@gmail.com"},
    {"laura", "laura42@domain.com"},
    {"marty", "marty_mcfly@webmail.com"}, 
    {"zorro", "zorro_007@gmail.com"},
    {"brady", "brady_22@domain.com"},
    {"lucy", "lucy_skywalker@gmail.com"},
    {"chris", "chris_jenkins@outlook.com"},
    {"gerge", "george_washington@domain.com"},
    {"robin", "robinhood@webmail.com"},
    {"bella", "bella_rose@mail.com"},
    {"ricky", "ricky_martin@gmail.com"},
    {"andy", "andy_robinson@yahoo.com"},
    {"zoe", "zoe_brown@domain.com"},
    {"sammy", "sammy_smith@aol.com"},
    {"lucas", "lucas.green@webmail.com"},
    {"apt", "pateau@outlook.com"},
    {"gerry", "gerry_jones@gmail.com"},
    {"harry", "harry_potter@domain.com"},
    {"nash", "nash_king@aol.com"},
    {"mario", "mario_bros@yahoo.com"},
    {"mike", "mike_tyson@domain.com"},
    {"candy", "candy_clark@webmail.com"},
    {"oscar", "oscar_mayer@gmail.com"},
    {"eddy", "eddy_stone@outlook.com"},
    {"sally", "sally_jones@domain.com"},
    {"tommy", "tommy_boy@aol.com"},
    {"penny", "penny_wise@webmail.com"},
    {"billy", "billy_joe@domain.com"},
    {"nancy", "nancy_drew@outlook.com"}
};

    HashTable h(25);
    
    for(const auto &item : items) {
    h.insertItem(item.first, item.second);
    }

    h.displayHash();
    h.searchItem("louis");
    h.searchItem("kekww");
    h.searchItem("addsafasdds");

}
