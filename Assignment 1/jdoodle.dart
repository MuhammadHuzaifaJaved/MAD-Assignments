import 'dart:io';

void main() {
  int score = 85;
  String greeting = "Welcome to Dart Programming!";
  bool isLearning = true;
  double temperature = 23.5;
  
  print("=== Variable Declarations ===");
  print("Score: $score");
  print("Greeting: $greeting");
  print("Is Learning: $isLearning");
  print("Temperature: ${temperature}°C");
  print("");
  
  print("=== User Input ===");
  print("Please enter your name:");
  String? name = stdin.readLineSync();
  
  print("Please enter your age:");
  String? ageInput = stdin.readLineSync();
  int age = int.tryParse(ageInput ?? '0') ?? 0;
  
  print("Hello $name! You are $age years old.");
  print("");
  
  List<String> cities = [
    "New York",
    "London", 
    "Tokyo",
    "Paris",
    "Sydney",
    "Dubai",
    "Mumbai"
  ];
  
  print("=== Cities List ===");
  print("Original order:");
  for (int i = 0; i < cities.length; i++) {
    print("${i + 1}. ${cities[i]}");
  }
  
  print("\nReversed order:");
  List<String> reversedCities = cities.reversed.toList();
  for (int i = 0; i < reversedCities.length; i++) {
    print("${i + 1}. ${reversedCities[i]}");
  }
  print("");
  
  Map<String, int> studentMarks = {
    "Ahmad": 92,
    "Ali": 78,
    "Zain": 85
  };
  
  print("=== Student Marks (Initial) ===");
  studentMarks.forEach((student, marks) {
    print("$student: $marks");
  });
  
  studentMarks["Huzaifa"] = 96;
  
  print("\n=== Student Marks (Updated) ===");
  studentMarks.forEach((student, marks) {
    print("$student: $marks");
  });
  print("");
  
  print("=== Age Classification ===");
  
  String ageCategory;
  if (age >= 13 && age <= 19) {
    ageCategory = "Teen";
  } else if (age >= 20 && age <= 59) {
    ageCategory = "Adult";
  } else if (age >= 60) {
    ageCategory = "Senior";
  } else {
    ageCategory = "Child";
  }
  
  print("Using if-else: $name, you are classified as a $ageCategory");
  
  String ageCategoryTernary = age >= 60 
      ? "Senior" 
      : age >= 20 
          ? "Adult" 
          : age >= 13 
              ? "Teen" 
              : "Child";
  
  print("Using ternary operator: $name, you are classified as a $ageCategoryTernary");
  
  print("\n=== Additional Age Comparisons ===");
  bool canVote = age >= 18 ? true : false;
  print("Can vote: $canVote");
  
  bool canRetire = age >= 65;
  print("Eligible for retirement: $canRetire");
  
  if (age < 13) {
    print("You're still a child - enjoy your childhood!");
  } else if (age == 18) {
    print("Congratulations! You just became an adult!");
  } else if (age > 100) {
    print("Wow! You're a centenarian!");
  } else {
    print("You're in the $ageCategory age group.");
  }
  
  print("\n=== Program Summary ===");
  print("Variables demonstrated: int, String, bool, double");
  print("User input collected: Name and Age");
  print("List operations: Original and reversed city display");
  print("Map operations: Initial map and adding new entries");
  print("Conditional logic: if-else and ternary operators used");
}