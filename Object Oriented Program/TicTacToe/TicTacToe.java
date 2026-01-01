package TicTacToe;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
 
public class TicTacToe extends JFrame implements ActionListener {
    //diba bonus points score tracking :>
    private JButton[] btn;
    private char play = 'x';
    private JPanel top = new JPanel();
    private JPanel center = new JPanel();
    private JLabel player1;
    private JLabel player2;
    private JButton clear;
    private String name1;
    private String name2;
    private int points1 = 0;
    private int points2 = 0;
    
    public TicTacToe() {

        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setSize(500,500);
        this.setLayout(new BorderLayout());
        top.setLayout(new GridLayout(1,2));
        center.setLayout(new GridLayout(3,3));
        this.add(top,BorderLayout.NORTH);
        this.add(center,BorderLayout.CENTER);
        this.setTitle("TicTacToe");

        btn = new JButton[9];
        
        for(int i = 0; i < btn.length; i++) {
            btn[i] = new JButton();
            btn[i].setPreferredSize(new Dimension(150,150));
            btn[i].setFont(new Font("Arial", Font.BOLD, 50));
            btn[i].addActionListener(this);
            btn[i].setBackground(new Color(0,0,0));
            center.add(btn[i]);
        }
        
        this.pack();
        this.setVisible(true);

        //while (name1 == null || name1.isEmpty()){
        //name1 = JOptionPane.showInputDialog(this, "Enter Player1 name: ");
        //}
        player1 = new JLabel("Player 1 [ x ]: " + "asdasd" + " - " + points1);
        top.add(player1);

        clear = new JButton("clear");
        clear.addActionListener(this);
        this.add(clear,BorderLayout.SOUTH);

       
        player2 = new JLabel("Player 2 [ o ]: " + "asdjkadjakd" + " - " + points2);
        top.add(player2);

        this.revalidate();
        this.repaint();

        
    }
 
    @Override
    public void actionPerformed(ActionEvent e) {
        JButton btnClick = (JButton) e.getSource();
 
        if(btnClick == btn[0]) {
            click(btn[0]);
        }
        if(btnClick == btn[1]) {
            click(btn[1]);
        }
        if(btnClick == btn[2]) {
            click(btn[2]);
        }
        if(btnClick == btn[3]) {
            click(btn[3]);
        }
        if(btnClick == btn[4]) {
            click(btn[4]);
        }
        if(btnClick == btn[5]) {
            click(btn[5]);
        }
        if(btnClick == btn[6]) {
            click(btn[6]);
        }
        if(btnClick == btn[7]) {
            click(btn[7]);
        }
        if(btnClick == btn[8]) {
            click(btn[8]);
        }
        if(btnClick == clear) {
           clear();
    
        }
    }
 
    public void click(JButton btn) {
        if(play == 'x') {
            btn.setText("x");
            btn.setEnabled(false);
            play = 'o';
        } else {
            btn.setText("o");
            btn.setEnabled(false);
            play = 'x';
        }
        check();
    }

    public void clear(){
        for(int i = 0; i < btn.length; i++) {
            btn[i].setEnabled(true);
            btn[i].setText("");
            play = 'x';
        }
    }

    public void point(int pnum){
    if(pnum ==1){
        JOptionPane.showMessageDialog(this, "Player 1, " + name1 + " wins", "WINNER WINNER CHICKEN DINNER", JOptionPane.PLAIN_MESSAGE);
        clear();
        points1++;
        player1.setText(("Player 1 [ x ]: " + name1 + " - " + points1));
    } else if (pnum == 2) {
        JOptionPane.showMessageDialog(this, "Player 2, " + name2 + " wins", "WINNER WINNER CHICKEN DINNER", JOptionPane.PLAIN_MESSAGE);
        clear();
        points2++;
        player2.setText(("Player 2 [ o ]: " + name2 + " - " + points2));
    }
    }

    public void check(){
        
        for(int i = 0; i < 9; i += 3){
            if(btn[i].getText() == btn[i+1].getText() && btn[i+1].getText() == btn[i+2].getText()){ 
                if(btn[i].getText() == "x"){
                    point(1);
                } else if (btn[i].getText() == "o"){
                    point(2);
                }
            }
        }
             for(int i = 0; i < 3; i++){
            if(btn[i].getText() == btn[i+3].getText() && btn[i+3].getText() == btn[i+6].getText()){ 
                if(btn[i].getText() == "x"){
                    point(1);
                } else if (btn[i].getText() == "o"){
                    point(2);
                }
            }
        }
        for(int i = 0; i < 3; i+=2){
            if(btn[i].getText() == btn[4].getText() && btn[4].getText() == btn[8-i].getText()){ 
                if(btn[i].getText() == "x"){
                    point(1);
                } else if (btn[i].getText() == "o"){
                    point(2);
                }
            }
        }
    
        for (int j = 0; j < 1; j++){
          for(int i = 0; i < btn.length; i++){
               if(btn[i].getText().equals("")){
                 return;
              }
         }
         JOptionPane.showMessageDialog(this, "An Unfortunate Draw" , "Pathetic Losers", JOptionPane.PLAIN_MESSAGE);
         clear();
        }    

    }
}
 