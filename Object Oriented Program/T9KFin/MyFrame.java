package T9KFin;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class MyFrame extends JFrame implements ActionListener{

    private String displaytext;
    private JTextField textField;
    private String lastBtn; //marks last string passed through a button to check if we should iterate through the elements
    private int loops = 0; //amount of consecutive taps of a single button
    private  Buttons btn = new Buttons(); //sorry sir, i cant find another way of implementing more than one other class aside from this

    
    public void buttonEvent(String str){ //receives a string to iterate through
        if(lastBtn != str){
        loops = 0;
        displaytext = textField.getText();
        textField.setText(displaytext + str.charAt(0)); //simply appends number on the first tap as its always on the 0th index
        lastBtn = str;
        loops++;
        } //if this is the first instance, it marks any further instances as a duplicate, therefore displaying further characters
        else
         {
            displaytext = textField.getText();
            if(!textField.getText().equals("")){
            displaytext = (displaytext.substring(0, displaytext.length() - 1)); //delete the previous instance of the same button to replace it
            }
            for(int i = 0; i < str.length(); i++){
            if(loops % str.length() == i){
            displaytext = (displaytext + str.charAt(i)); // "loops % str.length" is bound to match one of the values, displaying the character from the passed string in that corresponding position
            } //it's simple yet it handles 4 and 5 character buttons equally
        } //actually this is the most simplified yet effective method i can think of when handling this without overcomplicating or manually adding each letter
        //ergo, modifying the key's content makes this function valid nonetheless
            textField.setText(displaytext);
           loops++;
      }
    }

    public void actionPerformed(ActionEvent e){
        JButton btnClicked = (JButton) e.getSource();
        if(btnClicked == btn.button[0]){
            buttonEvent("1.?!"); //passes what a button will be able to iterate through
        }
        if(btnClicked == btn.button[1]){
            buttonEvent("2abc");
        }
        if(btnClicked == btn.button[2]){
            buttonEvent("3def");
        }
        if(btnClicked == btn.button[3]){
            buttonEvent("4ghi");
        }
        if(btnClicked == btn.button[4]){
            buttonEvent("5jkl");
        }
        if(btnClicked == btn.button[5]){
            buttonEvent("6mno");
        }
        if(btnClicked == btn.button[6]){
            buttonEvent("7pqrs");
        }
        if(btnClicked == btn.button[7]){
            buttonEvent("8tuv");
        }
        if(btnClicked == btn.button[8]){
            buttonEvent("9wxyz");
        }
        if(btnClicked == btn.button[9]){
            lastBtn = ""; //resets what was considered as the last Button, refreshing previous instances, allowing dupes 
        }
        if(btnClicked == btn.button[10]){
            buttonEvent("0,");
        }
        if(btnClicked == btn.button[11]){
            buttonEvent("#"); //a special case where it has nothing to loop through, so i'll allow further taps to make add a new pund sign
            lastBtn = "";//by not setting it as the last button, but this can be removed and the asterisk method can still apply
        }
        if(btnClicked == btn.button[12]){
            textField.setText(""); //literally empty
            lastBtn = "";//also resets the last button used
        }
        if(btnClicked == btn.button[13]){
            textField.setText(textField.getText() + " ");
            lastBtn = "";//also resets the last button used
        }
        if(btnClicked == btn.button[14]){
            if(!textField.getText().equals("")){ //to not cause an error, it will only allow backspace when its not empty
            displaytext = textField.getText();
            textField.setText(displaytext.substring(0, displaytext.length() - 1)); //substring manipulation method
            lastBtn = ""; //resets last button used
            }
        }
    }
    

    MyFrame(){
        new JFrame();
        //initialization of the brotherhood, Frame settigs
    
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setTitle("T9 Calculator UwU Final Pro MAX");
        this.setSize(400,550);
        this.setResizable(false);
        this.setVisible(true);
    
        this.setLayout(new BorderLayout());

        JPanel panel1 = new JPanel(new FlowLayout());
        JPanel panel2 = new JPanel(new GridLayout(5,3));
        this.add(panel1, BorderLayout.NORTH);
        this.add(panel2, BorderLayout.CENTER);
        textField = new JTextField();
        textField.setPreferredSize(new Dimension(220,80));
        textField.setFont(new Font("Simsun", Font.PLAIN, 14));

        panel1.add(textField);

        for(int i = 0; i < btn.button.length ; i++){
        panel2.add(btn.button[i]);
        btn.button[i].setFont(new Font("Simsun", Font.PLAIN, 14));
        btn.button[i].setFocusPainted(false);
        btn.button[i].setBorderPainted(false);
        btn.button[i].addActionListener(this);
    }
    }
    
}
