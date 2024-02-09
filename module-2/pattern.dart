import 'dart:io';

void main()
{
  for(int i=1;i<6;i++)
    {
      for (int j =1;j<=i;j++)
        {
          stdout.write("*");
        }
      print("");
    }


  for(int i=0;i<6;i++)
  {
    for (int j =0;j<i;j++)
    {
      stdout.write(i);
    }
    print("");
  }

  for(int i=1;i<7;i++)
  {
    for (int j =1;j<i;j++)
    {
      stdout.write(j);
    }
    print("");
  }

  int n = 5; // Number of rows in the triangle
  for (int i = 1; i <= n; i++) {
    // Print spaces
    for (int j = 1; j <= n-i; j++) {
      stdout.write(' ');
    }

    // Print stars
    for (int k = 1; k <= i; k++) {
      stdout.write('*');
    }
    print('');
  }


  int l = 5; // Number of rows in the triangle
  for (int i = 1; i <= l; i++) {
    // Print spaces
    for (int j = 1; j <= l; j++) {
      if(j<=l-i) {
        stdout.write(' ');
      }
      else
        {
          stdout.write(l-j+1);

        }
    }
    print('');
  }
  int a=1;
  for(int i=1;i<=5;i++)
    {
      for(int j=1;j<=i;j++)
        {
          stdout.write(a);
          a++;
        }
      print("");
    }


  for(int i=1;i<6;i++)
    {
      for(int j=1;j<=i;j++)
        {
          stdout.write("${i*i}  ");
        }
      print("");
    }


  int m = 5; // Number of rows in the triangle


  for (int i = 1; i <= m; i++) {
    // Print spaces
    for (int j = 1; j <= m - i; j++) {
      stdout.write(' ');
    }

    // Print numbers
    for (int k = 1; k <= i; k++) {
      stdout.write('$i ');

    }

    // Move to the next line
    print('');
  }
  
  int t=5;
  for(int i=1;i<=t;i++)
    {
      for(int j=1;j<=t;j++)
        {
          if(j<=t-i)
            {
              stdout.write(' ');
            }
          else
            {
              stdout.write("* ");
            }
        }
      print("");
    }



  int p=5;
  int f=1;
  for(int i=1;i<=p;i++)
  {
    f=1;
    for(int j=1;j<=p;j++)
    {
      if(j<=p-i)
      {
        stdout.write(' ');
      }
      else
      {
        stdout.write("$f ");
        f++;
      }
    }
    print("");
  }



}