// Write a program to find out the max from given number (E.g. No: -1562
// Max number is 6

import 'dart:io';

void main()
{
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());
  int m=0;
  while(num>0)
    {
      int n=num%10;
      if(n>m)
        {
          m=n;
        }
      num=num~/10;
    }
    print(m);
}