package lab02;

public class App {
	public static void main(String[] args){
		
		Shape circle = new Shape();
		Shape square = new Shape();
		Shape triangle = new Shape();
		
		circle.setRadius(5);
		square.setLength(10);
		triangle.setHeight(5);
		triangle.setBase(2);
		
		
        System.out.println("The Area of the Circle is: " + circle.calculateCircleArea());
        System.out.println("The Area of the Square is: " + square.calculateSquareArea());
        System.out.println("The Area of the Triangle is: " + triangle.calculateTriangleArea());
		//Redone for uniformity and readability 
	}
}

