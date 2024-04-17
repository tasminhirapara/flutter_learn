import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alertdialog extends StatefulWidget {
  const alertdialog({super.key});

  @override
  State<alertdialog> createState() => _alertdialogState();
}

class _alertdialogState extends State<alertdialog>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child:
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(onPressed: () {
                  showdialog(context);
                },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
                  child: Container(height: 55,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,),
                    child: Center(
                      child: Text("Show Dialog",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
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
          title: Text('Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Discription of your Alert data'),
                Text('add your data'),
              ],
            ),
          ),
          actions: [
            TextButton(child: Text('close'), onPressed: ()
            {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
