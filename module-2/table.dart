// Write a program you have to print the table of given number.

import 'dart:io';

void main()
{
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());

  for(int i=1;i<=10;i++)
    {
      print("$num  $i  ${num*i}");
    }

}