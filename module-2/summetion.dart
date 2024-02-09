// Write a program make a summation of given number
// (E.g. 1523 ans :-11)


import 'dart:io';

void main()
{
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());


    int n=num%10;
  while(num >=10)
    {
      num=num~/10;
    }

  int s=n+num;
  print(s);


}