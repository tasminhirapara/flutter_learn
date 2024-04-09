import 'package:flutter/material.dart';



class SeekBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seek Bar Color App',
      home: SeekBarColor(),
    );
  }
}

class SeekBarColor extends StatefulWidget {
  @override
  _SeekBarColorScreenState createState() => _SeekBarColorScreenState();
}

class _SeekBarColorScreenState extends State<SeekBarColor> {
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  Color backgroundColor = Colors.black;

  void updateBackgroundColor() {
    setState(() {
      backgroundColor = Color.fromRGBO(
        redValue.toInt(),
        greenValue.toInt(),
        blueValue.toInt(),
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
            value: redValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                redValue = value;
                updateBackgroundColor();
              });
            },
            label: 'Red: ${redValue.toInt()}',
            divisions: 255,
          ),
          Slider(
            value: greenValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                greenValue = value;
                updateBackgroundColor();
              });
            },
            label: 'Green: ${greenValue.toInt()}',
            divisions: 255,
          ),
          Slider(
            value: blueValue,
            min: 0.0,
            max: 255.0,
            onChanged: (value) {
              setState(() {
                blueValue = value;
                updateBackgroundColor();
              });
            },
            label: 'Blue: ${blueValue.toInt()}',
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
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text(
              'R: ${redValue.toInt()}, G: ${greenValue.toInt()}, B: ${blueValue.toInt()}',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
