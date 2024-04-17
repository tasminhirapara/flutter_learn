import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulefoure/q74/navigaterpush.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondpagepage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>onescreentoauother()),);
          }, child: Text('Go to firstpage'),
        ),
      ),
    );
  }
}
