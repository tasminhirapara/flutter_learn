import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulefoure/q74/secondpage.dart';

class onescreentoauother extends StatefulWidget {
  const onescreentoauother({super.key});

  @override
  State<onescreentoauother> createState() => _onescreentoauotherState();
}

class _onescreentoauotherState extends State<onescreentoauother> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firstpage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>secondpage()),);
          }, child: Text('Go to Secondpage'),
        ),
      ),
    );
  }
}
