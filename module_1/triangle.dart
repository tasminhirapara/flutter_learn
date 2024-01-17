// 5. Write a program to find the Area of Triangle
import 'dart:io';

void main()
{
      stdout.write("enter brith of triangle :");
      int b=int.parse(stdin.readLineSync().toString());
      stdout.write("enter high of triangle :");
      int h=int.parse(stdin.readLineSync().toString());;
      double area= (b*h)/2;
      print("area of triangle is $area");

}