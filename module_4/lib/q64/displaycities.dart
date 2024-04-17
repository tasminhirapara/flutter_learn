import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dispalycities extends StatefulWidget {
  const dispalycities({super.key});

  @override
  State<dispalycities> createState() => _dispalycitiesState();
}

class _dispalycitiesState extends State<dispalycities> {

  String selected = '';
  List<String> cities = ['Delhi', 'Bangalore', 'Hyderabad', 'Ahmedabad', 'Rajkot',];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 60,),
              ElevatedButton(onPressed: () {
                showdialog(context);
              },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
                child: Container(height: 55,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,),
                  child: Center(
                    child: Text("select name of cities",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(selected,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
  void showdialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('list of cities'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(cities[index]),
                    onTap: () {
                      setState(() {selected = cities[index];});
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  );
                },
              ),
            )
        );
      },
    );
  }
}
