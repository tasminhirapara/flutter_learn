import 'package:flutter/material.dart';



class CheckboxTextViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Textview App',
      home: CheckboxTextViewScreen(),
    );
  }
}

class CheckboxTextViewScreen extends StatefulWidget {
  @override
  _CheckboxTextViewScreenState createState() => _CheckboxTextViewScreenState();
}

class _CheckboxTextViewScreenState extends State<CheckboxTextViewScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Textview App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: _isChecked,
              child: Text(
                'This text is visible when checkbox is checked!',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
