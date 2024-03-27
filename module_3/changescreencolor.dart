import 'package:flutter/material.dart';



class ColorSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Selection App',
      home: ColorSelectionScreen(),
    );
  }
}

class ColorSelectionScreen extends StatefulWidget {
  @override
  _ColorSelectionScreenState createState() => _ColorSelectionScreenState();
}

class _ColorSelectionScreenState extends State<ColorSelectionScreen> {
  Color _selectedColor = Colors.white;

  void _onColorSelected(Color? color) {
    setState(() {
      if (color != null) {
        _selectedColor = color;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Selection App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile<Color>(
              title: Text('Red'),
              value: Colors.red,
              groupValue: _selectedColor,
              onChanged: _onColorSelected,
            ),
            RadioListTile<Color>(
              title: Text('Green'),
              value: Colors.green,
              groupValue: _selectedColor,
              onChanged: _onColorSelected,
            ),
            RadioListTile<Color>(
              title: Text('Blue'),
              value: Colors.blue,
              groupValue: _selectedColor,
              onChanged: _onColorSelected,
            ),
            RadioListTile<Color>(
              title: Text('Yellow'),
              value: Colors.yellow,
              groupValue: _selectedColor,
              onChanged: _onColorSelected,
            ),
            RadioListTile<Color>(
              title: Text('Purple'),
              value: Colors.purple,
              groupValue: _selectedColor,
              onChanged: _onColorSelected,
            ),
            SizedBox(height: 20),
            Text(
              'Selected Color:',
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
              color: _selectedColor,
            ),
          ],
        ),
      ),
    );
  }
}
