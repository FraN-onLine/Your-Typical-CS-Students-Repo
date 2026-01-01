package Lab03;

import java.text.DecimalFormat;  

public class App {
    
    public static void main(String[] args){

        UrbanArea urbanLand = new UrbanArea();
        DecimalFormat decimalFormat = new DecimalFormat("0.00");  

        urbanLand.setLength(249.4);
        urbanLand.setWidth(392.5);
        urbanLand.setPricePerSqM(917.00);

        System.out.println("The price of the Urban land within 5 years is " + decimalFormat.format(urbanLand.calculateTotalPrice()) + " Php");

        RuralArea ruralLand = new RuralArea();

        ruralLand.setLength(240.6);
        ruralLand.setWidth(150.6);
        ruralLand.setPricePerSqM(1337.00);

        System.out.println("The price of the Rural land within 5 years is " + decimalFormat.format(ruralLand.calculateTotalPrice()) + " Php");
        
        /*program now adds prices for years 1,2,3,4 and 5,
        or something... */
    }




}
