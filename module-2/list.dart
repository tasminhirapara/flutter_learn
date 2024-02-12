void main()
{
  List<String> a=["tasmin","smit"];
  a.add("kanak");
  print(a);
  print(a.length);
  a.remove("tasmin");
  print(a);
  a.remove(a[0]);
  print(a);
  List<String> b=["a","b"];
  a.addAll(b);
  print(a);
  for(String e in a)
    {
      print(e);
    }

}