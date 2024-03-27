import 'package:flutter/material.dart';



class SeekBarColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seek Bar Color App',
      home: SeekBarColorScreen(),
    );
  }
}

class SeekBarColorScreen extends StatefulWidget {
  @override
  _SeekBarColorScreenState createState() => _SeekBarColorScreenState();
}

class _SeekBarColorScreenState extends State<SeekBarColorScreen> {
  double _redValue = 0.0;
  double _greenValue = 0.0;
  double _blueValue = 0.0;

  Color _backgroundColor = Colors.black;

  void _updateBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        _redValue.toInt(),
        _greenValue.toInt(),
        _blueValue.toInt(),
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seek Bar Color App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Slider(
            value: _redValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                _redValue = value;
                _updateBackgroundColor();
              });
            },
            label: 'Red: ${_redValue.toInt()}',
            divisions: 255,
          ),
          Slider(
            value: _greenValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                _greenValue = value;
                _updateBackgroundColor();
              });
            },
            label: 'Green: ${_greenValue.toInt()}',
            divisions: 255,
          ),
          Slider(
            value: _blueValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                _blueValue = value;
                _updateBackgroundColor();
              });
            },
            label: 'Blue: ${_blueValue.toInt()}',
            divisions: 255,
          ),
          SizedBox(height: 20),
          Text(
            'Background Color:',
            style: TextStyle(fontSize: 18.0),
          ),
          Container(
            width: double.infinity,
            height: 200.0,
            color: _backgroundColor,
            alignment: Alignment.center,
            child: Text(
              'R: ${_redValue.toInt()}, G: ${_greenValue.toInt()}, B: ${_blueValue.toInt()}',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
