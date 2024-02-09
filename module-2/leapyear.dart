// 11. Write a Program to check the given year is leap year or not.

import 'dart:io';

void main()
{
  stdout.write("Enter a year to check: ");
  // String? input = stdin.readLineSync();
  // int x = int.parse(input!);
  int x= int.parse(stdin.readLineSync().toString());

  int y= (x%4);
  print(y);
  if(y == 0)
    {
      print("year is leap year");
    }
  else
    {
      print("year is not leap year");
    }

}