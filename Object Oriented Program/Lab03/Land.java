package Lab03;

public abstract class Land {
    protected double length;
    protected double width;
    protected double pricePerSqM;
    
    public void setLength(double length) {
        this.length = length;
    }

    public void setWidth(double width) {
        this.width = width;
    }
    
    public void setPricePerSqM(double pricePerSqM) {
        this.pricePerSqM = pricePerSqM;
    }

    public abstract double calculateTotalPrice();

}

