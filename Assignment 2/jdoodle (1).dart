import 'dart:io';

class Person {
  String _name; 
  int age;
  
  Person(this._name, this.age) {
    if (_name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
  }
  
  String get name => _name;
  
  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    _name = value;
  }
  
  void display() {
    print('Name: $_name, Age: $age');
  }
}

class Student extends Person {
  String rollNumber;
  String course;
  
  Student(String name, int age, this.rollNumber, this.course) 
      : super(name, age);
  
  Student.withDetails({
    required String name,
    required int age,
    required String rollNumber,
    required String course,
  }) : rollNumber = rollNumber,
       course = course,
       super(name, age);
  
  Student.quickCreate(String name, String rollNumber) 
      : rollNumber = rollNumber,
        course = 'General Studies',
        super(name, 18);
  
  @override
  void display() {
    print('Name: $name, Age: $age, Roll Number: $rollNumber, Course: $course');
  }
  
  String getStudentInfo() {
    return 'Student: $name (Roll: $rollNumber) - Age: $age, Course: $course';
  }
  
  bool isEnrolledIn(String courseName) {
    return course.toLowerCase() == courseName.toLowerCase();
  }
}

class StudentManager {
  List<Student> students = [];
  
  void addStudent(Student student) {
    students.add(student);
  }
  
  void displayAllStudents() {
    print('\n=== All Students ===');
    if (students.isEmpty) {
      print('No students found.');
      return;
    }
    
    for (int i = 0; i < students.length; i++) {
      print('${i + 1}. ${students[i].getStudentInfo()}');
    }
  }
  
  void displayStudentsByCourse(String courseName) {
    print('\n=== Students in $courseName ===');
    List<Student> filteredStudents = students.where(
      (student) => student.isEnrolledIn(courseName)
    ).toList();
    
    if (filteredStudents.isEmpty) {
      print('No students found in $courseName course.');
      return;
    }
    
    for (int i = 0; i < filteredStudents.length; i++) {
      print('${i + 1}. ${filteredStudents[i].getStudentInfo()}');
    }
  }
  
  List<String> getAllCourses() {
    return students.map((student) => student.course).toSet().toList();
  }
  
  void displayCourseStatistics() {
    print('\n=== Course Statistics ===');
    Map<String, int> courseCount = {};
    
    for (Student student in students) {
      courseCount[student.course] = (courseCount[student.course] ?? 0) + 1;
    }
    
    courseCount.forEach((course, count) {
      print('$course: $count student(s)');
    });
  }
}

void main() {
  print('=== Dart Object-Oriented Programming Demo ===\n');
  
  StudentManager manager = StudentManager();
  
  try {
    print('=== Creating Student Objects ===');
    
    Student student1 = Student('Alice Johnson', 20, 'CS001', 'Computer Science');
    Student student2 = Student('Bob Smith', 19, 'EE002', 'Electrical Engineering');
    
    Student student3 = Student.withDetails(
      name: 'Charlie Brown',
      age: 21,
      rollNumber: 'ME003',
      course: 'Mechanical Engineering'
    );
    
    Student student4 = Student.withDetails(
      name: 'Diana Prince',
      age: 22,
      rollNumber: 'CS004',
      course: 'Computer Science'
    );
    
    Student student5 = Student.quickCreate('Eve Adams', 'GS005');
    Student student6 = Student.quickCreate('Frank Miller', 'GS006');
    
    Student student7 = Student('Grace Lee', 20, 'EE007', 'Electrical Engineering');
    Student student8 = Student('Henry Wilson', 23, 'CS008', 'Computer Science');
    
    List<Student> allStudents = [
      student1, student2, student3, student4, 
      student5, student6, student7, student8
    ];
    
    for (Student student in allStudents) {
      manager.addStudent(student);
    }
    
    print('Successfully created ${allStudents.length} student objects.\n');
    
    print('=== Testing Getter/Setter Validation ===');
    print('Original name: ${student1.name}');
    
    student1.name = 'Alice Johnson-Smith';
    print('Updated name: ${student1.name}');
    
    manager.displayAllStudents();
    
    manager.displayStudentsByCourse('Computer Science');
    manager.displayStudentsByCourse('Electrical Engineering');
    manager.displayStudentsByCourse('General Studies');
    
    manager.displayCourseStatistics();
    
    print('\n=== Interactive Course Filtering ===');
    print('Available courses: ${manager.getAllCourses().join(', ')}');
    print('Enter a course name to filter students (or press Enter to skip):');
    
    String? userInput = stdin.readLineSync();
    if (userInput != null && userInput.isNotEmpty) {
      manager.displayStudentsByCourse(userInput);
    }
    
    print('\n=== Individual Student Details ===');
    for (int i = 0; i < 3 && i < allStudents.length; i++) {
      print('Student ${i + 1}:');
      allStudents[i].display();
    }
    
    print('\n=== Testing Validation Error ===');
    try {
      student1.name = ''; 
    } catch (e) {
      print('Validation error caught: $e');
    }
    
  } catch (e) {
    print('Error occurred: $e');
  }
  
  print('\n=== Program Completed Successfully ===');
}