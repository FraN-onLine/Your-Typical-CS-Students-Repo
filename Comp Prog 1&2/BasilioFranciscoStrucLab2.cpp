#include <iostream>
#include <stdio.h>
#include <string.h>

using namespace std;

struct name{
	string firstname;
	string middlename;
	string lastname;
};

struct address{
	string housenumber;
	string barangay;
	string street;
	string city;
	string province;
};

struct student{
	struct name studentname;
	char sex;
	int age;
	string studentnum;
	string course;
	struct address studentaddress;
	string contact;
	string email;
};

struct employee{
	struct name employeename;
	char sex;
	int age;
	string employeenum;
	string department;
	struct address employeeaddress;
	string contact;
	string email;
};

void addStudent(student *newstudent){
	cout << "\n--New Student--" << endl << endl;
	
	cout << "Enter Firstname: ";
	getline(cin,newstudent -> studentname.firstname);
	
	cout << "Enter Middlename: ";
	getline(cin,newstudent -> studentname.middlename);
	
	cout << "Enter Lastname: ";
	getline(cin,newstudent -> studentname.lastname);
	
	cout << "Enter Sex: ";
	cin >> newstudent -> sex;
	
	cout << "Enter Age: " ;
	cin >> newstudent -> age;
	
	getchar();
	
	cout << "Enter Student Number: ";
	getline(cin,newstudent -> studentnum);
	
	cout << "Enter Course: ";
	getline(cin,newstudent -> course);
	
	cout << "Enter House Number: ";
	getline(cin,newstudent -> studentaddress.housenumber);
	
	cout << "Enter Street: ";
	getline(cin,newstudent -> studentaddress.street);
	
	cout << "Enter Barangay: ";
	getline(cin,newstudent -> studentaddress.barangay);
	
	cout << "Enter City: ";
	getline(cin,newstudent -> studentaddress.city);
	
	cout << "Enter Province: ";
	getline(cin,newstudent -> studentaddress.province);
	
	cout << "Enter Contact: ";
	getline(cin,newstudent -> contact);
	
	cout << "Enter Email: ";
	getline(cin,newstudent -> email);
	
	
}

void displayStudent(student newstudent){
	cout << newstudent.studentname.lastname << ", " << newstudent.studentname.firstname << " " << newstudent.studentname.middlename << endl;
	
	cout << "Sex: " <<  newstudent.sex <<endl;
	cout << "Age: " <<  newstudent.age <<endl;
	cout << "Student Number: " <<  newstudent.studentnum <<endl;
	cout << "Course: " <<  newstudent.course <<endl;
	cout << "Address: " << newstudent.studentaddress.housenumber << " " << newstudent.studentaddress.street << ", " << newstudent.studentaddress.barangay << ", " << newstudent.studentaddress.city << ", " << newstudent.studentaddress.province << endl;
	cout << "Contact: " <<  newstudent.contact <<endl;
	cout << "Email: " <<  newstudent.email <<endl << endl;
}


void addEmployee(employee *newemployee){
	cout << "\n--New Employee--" << endl << endl;
	
	cout << "Enter Firstname: ";
	getline(cin,newemployee -> employeename.firstname);
	
	cout << "Enter Middlename: ";
	getline(cin,newemployee -> employeename.middlename);
	
	cout << "Enter Lastname: ";
	getline(cin,newemployee -> employeename.lastname);
	
	cout << "Enter Sex: ";
	cin >> newemployee -> sex;
	
	cout << "Enter Age: " ;
	cin >> newemployee -> age;
	
	getchar();
	
	cout << "Enter Employee ID: ";
	getline(cin,newemployee -> employeenum);
	
	cout << "Enter Department: ";
	getline(cin,newemployee -> department);
	
	cout << "Enter House Number: ";
	getline(cin,newemployee -> employeeaddress.housenumber);
	
	cout << "Enter Street: ";
	getline(cin,newemployee -> employeeaddress.street);
	
	cout << "Enter Barangay: ";
	getline(cin,newemployee -> employeeaddress.barangay);
	
	cout << "Enter City: ";
	getline(cin,newemployee -> employeeaddress.city);
	
	cout << "Enter Province: ";
	getline(cin,newemployee -> employeeaddress.province);
	
	cout << "Enter Contact: ";
	getline(cin,newemployee -> contact);
	
	cout << "Enter Email: ";
	getline(cin,newemployee -> email);
	
	
}

void displayEmployee(employee newemployee){
	cout << newemployee.employeename.lastname << ", " << newemployee.employeename.firstname << " " << newemployee.employeename.middlename << endl;
	
	cout << "Sex: " <<  newemployee.sex <<endl;
	cout << "Age: " <<  newemployee.age <<endl;
	cout << "Employee: " <<  newemployee.employeenum <<endl;
	cout << "Department: " <<  newemployee.department <<endl;
	cout << "Address: " << newemployee.employeeaddress.housenumber << " " << newemployee.employeeaddress.street << ", " << newemployee.employeeaddress.barangay << ", " << newemployee.employeeaddress.city << ", " << newemployee.employeeaddress.province << endl;
	cout << "Contact: " <<  newemployee.contact <<endl;
	cout << "Email: " <<  newemployee.email <<endl << endl;
}








int main(){
	struct student students[20];
	struct employee employees[20];
	
	int choice;
	int studentcount = 0;
	int employeecount = 0;
	
	while(true){
	cout << "\n[1] Create Student\n[2] Create Employee \n[3] Exit" << endl << "Choice: ";
	cin >> choice;
	getchar();
	
	switch(choice){
		
		case 1:
			 addStudent(&students[studentcount]);
			 studentcount++;
			break;
			
		case 2:
			addEmployee(&employees[employeecount]);
			employeecount++;
			break;
			
		default:
			return 0;
			
			
		
	}
	
	if(studentcount != 0){
	
	cout << "\n\nDisplaying Student Information" << endl;
	
	for(int i = 0; i < studentcount;i++){
		displayStudent(students[i]);
	}
}
	
	if(employeecount != 0){
	cout << "\n\nDisplaying Employee Information" << endl;
	
	for(int j = 0; j < employeecount;j++){
		displayEmployee(employees[j]);
	}
}
	
}
	
	
}
