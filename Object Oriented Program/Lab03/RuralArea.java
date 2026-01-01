package Lab03;

public class RuralArea extends Land {
    
    public double calculateTotalPrice(){
    double totalPrice = 0;
    double pricePerYear = length * width * pricePerSqM; // initial price for the first year
    totalPrice += pricePerYear; // add initial price for the first year

    for (int i = 0; i < 4; i++) { // loop for the four years after
        pricePerYear *= 1.034;  // calculate price for the current year with 3.4% increase
        totalPrice += pricePerYear; // add price for the current year to the total price
    }

    return totalPrice;
}


}
