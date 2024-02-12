void main()
{
  Set<String> a=Set();
  a.add("tasmin");
  a.add("tasmin");
  a.add("tasmin");
  a.add("tasmin");
  a.add("tasmin");
  a.add("smit");
  a.add("meet");
  a.add("kanak");
  a.add("ronak");
  print(a);
  a.remove("tasmin");
  Set<String> b= Set();
  b.add("ghjk");
  a.add("fghj");
  a.add("tyui");

  a.addAll(b);

}