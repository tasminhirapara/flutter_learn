// 13. Write a program to find the Max number from the given three
// number using Nested If

import 'dart:io';

void main()
{
  stdout.write("enter number 1 :");
  int n1= int.parse(stdin.readLineSync().toString());

  stdout.write("enter number 2 :");
  int n2= int.parse(stdin.readLineSync().toString());

  stdout.write("enter number 3 :");
  int n3= int.parse(stdin.readLineSync().toString());

  if(n1>n2 && n1>n3)
    {
      print("max no is $n1");
    }
  else if(n2>n1 && n2>n3)
    {
      print("max no is $n2");

    }
  else
    {
      print("max no is $n3");
    }
}