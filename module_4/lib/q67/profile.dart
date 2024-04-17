import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileofuser extends StatefulWidget {
  const profileofuser({super.key});

  @override
  State<profileofuser> createState() => _profileofuserState();
}

class _profileofuserState extends State<profileofuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: IconButton(onPressed: () {  }, icon: Column(
            children: [
              Icon(Icons.person,size: 60,),
              SizedBox(height: 30,),
              Text("name")
            ],
          ),),
        ),
      ),
    );
  }
}
