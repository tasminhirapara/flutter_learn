import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toastmassage extends StatefulWidget {
  const toastmassage({super.key});

  @override
  State<toastmassage> createState() => _toastmassageState();
}

class _toastmassageState extends State<toastmassage>
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
            TextButton(
              child: Text('Positive'), onPressed: () {Fluttertoast.showToast(msg: ' users choice is Positive ');Navigator.of(context).pop();},
            ),
            TextButton(
              child: Text('Negative'), onPressed: () {Fluttertoast.showToast(msg: ' users choice is Negative ');Navigator.of(context).pop();},
            ),
            TextButton(child: Text('Neutral'), onPressed: () {Fluttertoast.showToast(msg: ' users choice is Neutral ');Navigator.of(context).pop();},
            ),
          ],
        );
      },
    );
  }
}
