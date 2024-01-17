// 8. Write a program to calculate sum of 5 subjects & find the
// percentage. Subject marks entered by user.
import 'dart:io';

void main()
{
  stdout.write("enter marks of subject 1 : ");
  int sub1=int.parse(stdin.readLineSync().toString());

  stdout.write("enter marks of subject 2 : ");
  int sub2=int.parse(stdin.readLineSync().toString());

  stdout.write("enter marks of subject 3 : ");
  int sub3=int.parse(stdin.readLineSync().toString());

  stdout.write("enter marks of subject 4 : ");
  int sub4=int.parse(stdin.readLineSync().toString());

  stdout.write("enter marks of subject 5 : ");
  int sub5=int.parse(stdin.readLineSync().toString());

  double per=(sub1+sub2+sub3+sub4+sub5)/5;
  print("percentage : $per");
}