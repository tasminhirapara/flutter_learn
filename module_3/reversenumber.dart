import 'package:flutter/material.dart';



class ReverseNumberprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reverse Number',
      home: Reverse(),
    );
  }
}

class Reverse extends StatefulWidget {
  @override
  _ReverseNumberScreenState createState() => _ReverseNumberScreenState();
}

class _ReverseNumberScreenState extends State<Reverse> {
  TextEditingController number = TextEditingController();
  String reverseNumber = '';

  void reverse() {
    setState(() {
      String input = number.text;
      String reversed = input.split('').reversed.join('');
      reverseNumber = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReverseNumber'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: number,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: reverse,
              child: Text('Reverse'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Reversed Number: $reverseNumber',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }
}
