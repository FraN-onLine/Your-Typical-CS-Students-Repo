package lab02;

public class Shape{

    private double radius;
    private double length;
    private double base;
    private double height;

    //setters
    
    public void setHeight(double height) {
        this.height = height;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }
    
    public void setLength(double length) {
        this.length = length;
    }
    
    public void setBase(double base) {
        this.base = base;
    }

    public double calculateCircleArea(){
       double circleArea = Math.PI * radius * radius;
       return circleArea;
    }

    public double calculateSquareArea(){
        double squareArea = length * length;
        return squareArea;
    }

    public double calculateTriangleArea(){
        double triangleArea = height * base * 0.5;
        return triangleArea;
    }


}