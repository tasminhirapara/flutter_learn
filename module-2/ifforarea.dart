// 19. Write a program of to find out the Area of Triangle, Rectangle and
// Circle using If Condition.(Must Be Menu Driven)

import 'dart:io';

void main()
{
  print("1 for triangle");
  print("2 for rectangle");
  print("3 for circle");
  int opt= int.parse(stdin.readLineSync().toString());
  if(opt==1) {
    stdout.write("enter hight of triangle");
    int h = int.parse(stdin.readLineSync().toString());
    stdout.write("enter brith of triangle");
    int b = int.parse(stdin.readLineSync().toString());
    double area = (h * b) / 2;
    print("area of triangle : $area");

  }
  else if(opt==2)
    {
      stdout.write("enter hight of rectangle");
      int h = int.parse(stdin.readLineSync().toString());
      stdout.write("enter brith of rectangle");
      int b = int.parse(stdin.readLineSync().toString());
      int area = h * b ;
      print("area of triangle : $area");
    }
  else if(opt==3)
  {
    stdout.write("enter redious of circale");
    int r = int.parse(stdin.readLineSync().toString());
    double area = 3.14* r*r ;
    print("area of triangle : $area");
  }
  else
    {
      print("invalid input");
    }

  
  
}