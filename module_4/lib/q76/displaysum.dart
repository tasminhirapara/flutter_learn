import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class display extends StatefulWidget {
  final int num1;
  final int num2;
  const display({super.key,required this.num1, required this.num2});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    int sum = widget.num1 +widget.num2;
    return Scaffold(
      appBar: AppBar(
        title:Text('sum'),
      ),
      body: Center(
        child: Text(
          'Sum of two number is: $sum',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
