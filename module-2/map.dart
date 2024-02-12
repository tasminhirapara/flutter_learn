void main()
{
  Map<String,int> m = {
    "tasmin" : 1,
        'smit':5,
    "kanak": 8


  };
  print(m);
  Map<String,int> n= Map();
  n["met"] =6;
  n["love"]=9;
  print(n);
  print(m.length);
  print(m.keys);
  print(m.values);
  print(m.isEmpty);
  print(m.containsKey("tasmin"));
  print(m.update('tasmin', (value) => 10));
  m.remove("tasmin");
  print(m);

  for(String e in m.keys)
    {
      print(e);
    }

}