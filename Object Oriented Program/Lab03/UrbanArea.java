package Lab03;

public class UrbanArea extends Land{
    
    public double calculateTotalPrice(){
        double pricePerYear = length * width * pricePerSqM; //temporarily stores Principal
        double totalPrice = pricePerYear; //first year inclusive
        for (int i = 0; i < 4; i++) {
            pricePerYear *= 1.055;  //5.5% increase, FV = PV x (1 + Rate)^n, wherein each year is added onto the total
            totalPrice += pricePerYear; //originally it returns value of pricePerYear *= Math.Pow(1.055, 5)
        }
        return totalPrice;
        //ewan ko na sa calculations, ginagaslight ata ako
    }
}
