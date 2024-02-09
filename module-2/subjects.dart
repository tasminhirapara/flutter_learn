// 16. Write a program user enter the 5 subjects mark. You have to make a
// total and find the percentage. percentage > 75 you have to print
// “Distinction” percentage > 60 and percentage <= 75 you have to
// print “First class” percentage >50 and percentage <= 60 you have to
// print “Second class” percentage > 35 and percentage <= 50 you have to
// print “Pass class” Otherwise print “Fail”
import 'dart:io';

void main() {
    stdout.write("Enter marks for subject 1: ");
    int s1 = int.parse(stdin.readLineSync()!);
    stdout.write("Enter marks for subject 2: ");
    int s2 = int.parse(stdin.readLineSync()!);
    stdout.write("Enter marks for subject 3: ");
    int s3 = int.parse(stdin.readLineSync()!);
    stdout.write("Enter marks for subject 4: ");
    int s4 = int.parse(stdin.readLineSync()!);
    stdout.write("Enter marks for subject 5: ");
    int s5 = int.parse(stdin.readLineSync()!);

    int total = s1+s2+s3+s4+s5;
    double percentage = (total / 5) ;


    if (percentage > 75) {
      print("Distinction");
    } else if (percentage > 60 && percentage <= 75) {
      print("First class");
    } else if (percentage > 50 && percentage <= 60) {
      print("Second class");
    } else if (percentage > 35 && percentage <= 50) {
      print("Pass class");
    } else {
      print("Fail");
    }
    print("Total Marks: $total");
    print("Percentage: $percentage%");
}