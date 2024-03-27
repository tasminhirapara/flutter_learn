import 'package:flutter/material.dart';



class ReverseNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reverse Number',
      home: ReverseNumberScreen(),
    );
  }
}

class ReverseNumberScreen extends StatefulWidget {
  @override
  _ReverseNumberScreenState createState() => _ReverseNumberScreenState();
}

class _ReverseNumberScreenState extends State<ReverseNumberScreen> {
  TextEditingController _numberController = TextEditingController();
  String _reverseNumber = '';

  void _reverse() {
    setState(() {
      String input = _numberController.text;
      String reversed = input.split('').reversed.join('');
      _reverseNumber = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _reverse,
              child: Text('Reverse'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Reversed Number: $_reverseNumber',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
