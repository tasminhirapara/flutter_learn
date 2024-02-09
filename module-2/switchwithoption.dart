// 18. Write a Program of Addition, Subtraction ,Multiplication and
// Division using Switch case.(Must Be Menu Driven)

import 'dart:io';

void main()
{
  stdout.write("enter your no 1:");
  int num1= int.parse(stdin.readLineSync().toString());
  stdout.write("enter your no 2:");
  int num2= int.parse(stdin.readLineSync().toString());

  print("1 for addition");
  print("2 for subsraction");
  print("3 for multiplication");
  print("4 for division");
  int ope=int.parse(stdin.readLineSync().toString());

  switch(ope)
      {
    case 1:
      int add=num1+num2;
      print("addition is : $add");
    case 2:
      int sub=num1-num2;
      print("subsraction is : $sub");
    case 3:
      int mul=num1*num2;
      print("multiplication is : $mul");
    case 4:
      double div=num1/num2;
      print("division is : $div");
    default:
      print("input is invalid");
  }

}