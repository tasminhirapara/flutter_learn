// 10. Write a Program to check the given number is Positive, Negative.
import 'dart:io';

void main()
{
  stdout.write("enter number :");
  double num = double.parse(stdin.readLineSync().toString());
  if(num>0)
    {
      print("your number is positive");
    }
  else
    {
      print("your number is negative");
    }
}