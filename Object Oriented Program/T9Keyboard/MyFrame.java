package T9Keyboard;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MyFrame extends JFrame implements ActionListener{

    private String displaytext;
    private JButton[] button;
    JTextField textField;

    private void buttonEvent(String str){
        displaytext = textField.getText();
        textField.setText(displaytext + str);
    }
    
    public void actionPerformed(ActionEvent e){
        JButton btnClicked = (JButton) e.getSource();
        if(btnClicked == button[0]){
            buttonEvent("1");
        }
        if(btnClicked == button[1]){
            buttonEvent("2");
        }
        if(btnClicked == button[2]){
            buttonEvent("3");
        }
        if(btnClicked == button[3]){
            buttonEvent("4");
        }
        if(btnClicked == button[4]){
            buttonEvent("5");
        }
        if(btnClicked == button[5]){
            buttonEvent("6");
        }
        if(btnClicked == button[6]){
            buttonEvent("7");
        }
        if(btnClicked == button[7]){
            buttonEvent("8");
        }
        if(btnClicked == button[8]){
            buttonEvent("9");
        }
        if(btnClicked == button[9]){
            buttonEvent("*");
        }
        if(btnClicked == button[10]){
            buttonEvent("0");
        }
        if(btnClicked == button[11]){
            buttonEvent("#");
        }
        if(btnClicked == button[12]){
            textField.setText("");
        }
        if(btnClicked == button[14]){
            if(!textField.getText().equals("")){
            displaytext = textField.getText();
            textField.setText(displaytext.substring(0, displaytext.length() - 1));
            }
        }
    }
    
    MyFrame(){
    new JFrame();

    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setTitle("T9 uWu");
    this.setSize(400,550);
    this.setResizable(false);
    this.setVisible(true);

    this.setLayout(new BorderLayout());

    JPanel panel1 = new JPanel(new FlowLayout());
    JPanel panel2 = new JPanel(new GridLayout(5,3));
    this.add(panel1, BorderLayout.NORTH);
    this.add(panel2, BorderLayout.CENTER);
    textField = new JTextField();
    textField.setPreferredSize(new Dimension(200,50));
    textField.setFont(new Font("Calibiri Light", Font.PLAIN, 14));

    panel1.add(textField);
    button = new JButton[15];
    button[0] = new JButton("<html><center>1<br/>.?!</center> </html>");
    button[1] = new JButton("<html><center>2 <br/>abc</center></html>");
    button[2] = new JButton("<html><center>3<br/>def</center></html>");
    button[3] = new JButton("<html><center>4 <br/>ghi</center></html>");
    button[4] = new JButton("<html><center>5 <br/>jkl</center></html>");
    button[5] = new JButton("<html><center>6 <br/>mno</center></html>");
    button[6] = new JButton("<html><center>7 <br/>pqrs</center></html>");
    button[7] = new JButton("<html><center>8 <br/>tuv</center></html>");
    button[8] = new JButton("<html><center>9 <br/>wxyz</center></html>");
    button[9] = new JButton(" *");
    button[10]= new JButton("<html><center>0 <br/>, </center></html>");
    button[11] = new JButton(" # ");
    button[12] = new JButton(" Clear ");
    button[13] = new JButton("");
    button[14] = new JButton(" <-- ");

    for(int i = 0; i < button.length ; i++){
        panel2.add(button[i]);
        button[i].setFont(new Font("Calibiri Light", Font.PLAIN, 14));
        //button[i].setBackground(new Color(0x42F1CD));
        button[i].setBorderPainted(false);
        button[i].addActionListener(this);
    }

}
}