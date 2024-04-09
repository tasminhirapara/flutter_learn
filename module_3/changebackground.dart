import 'package:flutter/material.dart';


class BackgroundChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Change',
      home: BackgroundChangeScreen(),
    );
  }
}

class BackgroundChangeScreen extends StatefulWidget {
  @override
  _BackgroundChangeScreenState createState() => _BackgroundChangeScreenState();
}

class _BackgroundChangeScreenState extends State<BackgroundChangeScreen> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      // Generate a random color
      _backgroundColor = Color(0xFF000000 + (DateTime.now().microsecondsSinceEpoch % 0xFFFFFF));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackgroundChange'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('ChangeBackground'),
          ),
        ),
      ),
    );
  }
}
