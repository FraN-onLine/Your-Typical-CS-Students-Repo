package StudentTracker;

public class Student {

        private static int studentCount = 0; 
        private String studentId;
        private String name;
    
        public Student(String name) {
            this.name = name;
            studentCount++;
            this.studentId = String.format("24-%04d", studentCount);
        }
    
        public void displayStudent() {
            System.out.println("ID: " + this.studentId + " , " + this.name);
        }

        public static int getTotalStudents() {
            return studentCount;
        }
}  

