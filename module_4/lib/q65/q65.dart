import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exitdialog extends StatefulWidget {
  const exitdialog({super.key});

  @override
  State<exitdialog> createState() => _exitdialogState();
}

class _exitdialogState extends State<exitdialog>
{
  @override
  Widget build(BuildContext context)
  {
    return WillPopScope(
      onWillPop: conformdialog,
      child: Scaffold(),
    );
  }
  Future<bool> conformdialog() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to exit the app?'),
        actions:[
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('No'),),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Yes'),),
        ],
      ),
    )) ?? false;
  }
}
