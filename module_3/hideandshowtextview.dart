import 'package:flutter/material.dart';



class Checkboxvisibilitychanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Textview App',
      home: Checkboxvisibility(),
    );
  }
}

class Checkboxvisibility extends StatefulWidget {
  @override
  _CheckboxTextViewScreenState createState() => _CheckboxTextViewScreenState();
}

class _CheckboxTextViewScreenState extends State<Checkboxvisibility> {
  bool Checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checkbox visible'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: Checked,
              onChanged: (value) {
                setState(()
                {
                  Checked = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: Checked,
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
