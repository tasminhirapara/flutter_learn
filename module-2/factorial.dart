// Write a program you have to find the factorial of given number.
import 'dart:io';

void main()
{
  stdout.write("enter your number :");
  int num= int.parse(stdin.readLineSync().toString());
  double fact=1;
  if(num==0 || num==1)
    {
      print("factorial is $fact");
    }
  else
    {
      for(int i=1;i<=num;i++)
        {
          fact*=i;
        }
      print("factorial is $fact");
    }

}