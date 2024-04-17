import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modulefoure/q67/profile.dart';

class manuoption extends StatefulWidget {
  const manuoption({super.key});

  @override
  State<manuoption> createState() => _manuoptionState();
}

class _manuoptionState extends State<manuoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("option manu"),
        actions:[
          PopupMenuButton(
            onSelected: (String result) {
              if (result == 'profile') {
                Navigator.push(context, MaterialPageRoute(builder: (context) => profileofuser()),);
              } else if (result == 'logout') {Fluttertoast.showToast(msg: 'Logout');}
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'profile',
                child: ListTile(leading: Icon(Icons.person), title: Text('Profile'),),
              ),
              PopupMenuItem(
                value: 'logout',
                child: ListTile(leading: Icon(Icons.logout), title: Text('Logout'),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
