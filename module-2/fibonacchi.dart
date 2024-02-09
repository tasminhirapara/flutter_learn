// Write a program you have to print the Fibonacci series up to user given
// number

import 'dart:io';

void main()
{
  int a=0,b=1,c;
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());
   for(int i=1;i<=num;i++)
     {
       print(a);
       c=a+b;
       a=b;
       b=c;


     }


}