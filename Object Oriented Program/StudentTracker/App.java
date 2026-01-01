package StudentTracker;

public class App {
    public static void main(String[] args) {
        Student[] students = {
        new Student("Acidera"),
        new Student("Acoba"),
        new Student("Alberto"),
        new Student("Alcausin"),
        new Student("Alegre"),
        new Student("Aragon"),
        new Student("Asiao"),
        new Student("Bagasani"),
        new Student("Balcita"),
        new Student("Bolusan"),
        new Student("Bonifacio"),
        new Student("Bullanday"),
        new Student("Bumagat"),
        new Student("Cabie"),
        new Student("Cabungan")
        };
       

        for (Student student : students) {
            student.displayStudent();
        }

        System.out.println("Total Number of Students is: " + Student.getTotalStudents());
        
    }
}
