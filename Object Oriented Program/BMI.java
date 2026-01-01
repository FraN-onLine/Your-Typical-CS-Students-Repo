import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BMI {
    
    public static void main(String[] args) {
     
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 500);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(6, 1));
        frame.add(panel);
        frame.setVisible(true);
  
        JTextField heightTextField = new JTextField();
        JTextField weightTextField = new JTextField();
        
        panel.add(new JLabel("Height: (in meters)"));
        panel.add(heightTextField);
        panel.add(new JLabel("Weight: (in kilograms)"));
        panel.add(weightTextField);
     
        
        JButton calcBMI = new JButton("Calculate BMI");
        panel.add(calcBMI);
        
        JLabel resultLabel = new JLabel("BMI: ");
        panel.add(resultLabel);
        
        calcBMI.addActionListener(new ActionListener() {
            
            public void actionPerformed(ActionEvent e) {
                    double height = Double.parseDouble(heightTextField.getText());
                    double weight = Double.parseDouble(weightTextField.getText());
                    
                    double bmi = weight / (height * height);
                    String comment;

                    if(bmi < 18.5){
                        comment = "Undernutrition";
                    } else if (bmi < 25){
                        comment = "Optimal"; //di ko na linagyan ng or condition due to 18.5 and less being barred by first if
                    } else if (bmi < 30){
                        comment = "Overweight";
                    } else {
                        comment = "Obese";
                    }
    
                    resultLabel.setText(String.format("BMI: %.2f, %s", bmi, comment));
            }
        });

        frame.repaint();
        frame.revalidate();
    }
}
