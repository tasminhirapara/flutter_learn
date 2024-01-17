// 4. Write a program to find the Area of Circle

import 'dart:io';

void main()
{
  double pi=3.14;
  stdout.write("enter circule redius :");
  int r= int.parse(stdin.readLineSync().toString());
  double area=pi*r*r;
  print("area of circule : $area");

}
