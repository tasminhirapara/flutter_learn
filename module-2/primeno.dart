// 12. Write a Program to check the given number is prime or not prime.

import 'dart:io';

void main()
{
  stdout.write("enter your no :");
  int num=int.parse(stdin.readLineSync().toString());
  int a=0;
  for(int i=2;i<num;i++)
    {
      if(num%i ==0)
        {
          a=1;
        }
    }
  if(a==0)
    {
      print("your number is prime number");
    }
  else{
    print("your number is not prime number");
  }


}