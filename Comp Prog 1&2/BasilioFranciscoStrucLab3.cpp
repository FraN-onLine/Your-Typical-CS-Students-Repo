#include <iostream>
#include <limits>

using namespace std;

struct Product {
    int productID;
    string productName;
    int quantityInStock;
    double pricePerUnit;
}; //struct requirement

void inputProductData(Product products[5][4], int numProducts){
	  for (int i = 0; i < numProducts; i++) {
        cout << "\nEnter details for product " << i + 1 << ":\n";
        cout << "Product ID: ";
        cin >> products[i][0].productID;
        cin.ignore();
        cout << "Product Name: ";
        getline(cin,products[i][1].productName);
        cout << "Quantity in Stock: ";
        cin >> products[i][2].quantityInStock;
        cout << "Price per Unit: Php";
        cin >> products[i][3].pricePerUnit;
    }
}


void displayInventory(Product products[5][4], int numProducts){
	  cout << "\nInventory Details:\n";
    for (int i = 0; i < numProducts; i++) {
    	cout << "\nProduct " << i + 1 << ":" << endl;
        cout << "ID: " << products[i][0].productID << endl;
		cout << "Name: " << products[i][1].productName << endl; 
    	cout << "Quantity: " << products[i][2].quantityInStock << endl;
		cout <<	"Price: Php" << products[i][3].pricePerUnit << endl;
    }
}
double calculateTotalValue(Product products[5][4], int numProducts){
	double totalValue = 0;
    for (int i = 0; i < numProducts; i++) {
        totalValue += products[i][2].quantityInStock * products[i][3].pricePerUnit;
    }
    return totalValue;
}

int main() {
		
    int numProducts;
	
	cout << "\t---Inventory Management System---\n" << endl;
    
    do{
    	
    cout << "Enter the number of products in the inventory: ";
    cin >> numProducts;
    
    if (numProducts > 5 || numProducts <= 0){
	cin.clear();
	cin.ignore(numeric_limits<streamsize>::max(), '\n'); //type mismatch exception, try lang sir 
    cout << "Invalid Input, Please enter within 1-5\n" << endl;
    }
    
	} while (numProducts > 5 || numProducts <= 0); //maximum of 5 requirement

    Product products[5][4]; //2d array requirement
    
    inputProductData(products, numProducts);//function requirement
    displayInventory(products, numProducts);
    
    cout << "\nTotal inventory value: Php" << calculateTotalValue(products, numProducts) << endl;

}
