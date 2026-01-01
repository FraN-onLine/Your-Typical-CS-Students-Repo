package Chessboard;

import javax.swing.*;
import java.awt.*;

public class App {
    public static void main(String[] args) {
    final long endTime, startTime = System.nanoTime();
        
    JFrame frame = new JFrame();
    frame.setVisible(true);
    frame.setLayout(new GridLayout(8,8));
    frame.setSize(1500,1500);

    JPanel[] panel = new JPanel[64];
    // for(int i = 0; i < 64; i++){
    //     panel[i] = new JPanel();
    //     if(i % 16 < 8){
    //         if(i % 2 == 0){
    //             panel[i].setBackground(Color.BLACK);
    //             } else {
    //             panel[i].setBackground(Color.WHITE);
    //             }    
    //     } else {
    //         if(i % 2 == 0){
    //             panel[i].setBackground(Color.WHITE);
    //             } else {
    //             panel[i].setBackground(Color.BLACK);
    //             }
    //     }
    //     frame.add(panel[i]);
    // }

    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
             panel[i] = new JPanel();
            if((i % 2) == 0 && (j % 2) == 0){
                panel[i].setBackground(Color.BLACK);
                } else if ((i % 2) != 0 && (j % 2) != 0) {
                    panel[i].setBackground(Color.BLACK);
                } else {
                panel[i].setBackground(Color.WHITE);
                }    
                frame.add(panel[i]);
        }
    }

    endTime = System.nanoTime();
    System.out.println("Code Took " + (endTime - startTime) + " Nanoseconds");
    }

}
