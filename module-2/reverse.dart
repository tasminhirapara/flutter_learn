// Write a program to print the number in reverse order.

import 'dart:io';

void main()
{
  int r=0;
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());
   while(num>0)
   {
     int  n=num%10;
    r=r*10+n;
    num=num~/10;
   }
   print("your reversed number is $r");
}