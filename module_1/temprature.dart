// 7. Write a program to convert temperature from degree centigrade to
// Fahrenheit.
import 'dart:io';

void main()
{
  stdout.write("enter tempreture in  degree centigrade : ");
  double c= double.parse(stdin.readLineSync().toString());
  double f= (c*9/5)+32;
  print("temprature in Fahrenheit : $f ");


}