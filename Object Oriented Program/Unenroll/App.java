package Unenroll;

import java.util.InputMismatchException;
import java.util.Scanner;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

public class App {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        final JDialog dialog = new JDialog();
        dialog.setAlwaysOnTop(true);

        String[] students = {
            "Acidera", "Acoba",
            "Alberto", "Alcausin",
            "Alegre",  "Aragon",
            "Asiao",   "Bagasani",
            "Balcita", "Bolusan"
            }; 

            int i = 1;

            System.out.println("List of currently enrolled Students:");
            for (String student : students) {
                System.out.println(i + ". " + student);
                i++;
            }

            boolean numsel = false;
            int input = 0;

            while(!numsel){
            System.out.print("Select a number to unenroll: ");

            try{
            input = scan.nextInt();
            numsel = true;
            } catch (InputMismatchException e){
                scan.nextLine();
            }

            if(input <= 0 || input > students.length){
                i = 1;
                System.out.println("Select a valid id\n");
                for (String student : students) {
                    System.out.println(i + ". " + student);
                    i++;
                }
                numsel = false;
            }
            
        }
           
         int confirm = JOptionPane.showConfirmDialog(dialog, "Are you sure you wanna unenroll " + students[input-1] +"?", 
         "Are u sure?" , JOptionPane.YES_NO_CANCEL_OPTION );

         if(confirm == 0){
            String[] studentsnew = new String[students.length - 1];
            System.arraycopy(students, 0, studentsnew, 0, input - 1);
            System.arraycopy(students, input, studentsnew, input - 1, students.length - input);
            System.out.println("Unenrolled " + students[input - 1] + "\nUpdated Roster:");
            i = 1;
            for (String student : studentsnew) {
                System.out.println(i + ". " + student);
                i++;
            }
         } else {
            System.out.println("Terminated");
            i = 1;
            for (String student : students) {
                System.out.println(i + ". " + student);
                i++;
            }
         }
         scan.close();
       
     }
 }