import 'package:flutter/material.dart';



class FontSizeChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'change font size',
      home: changefontsize(),
    );
  }
}

class changefontsize extends StatefulWidget {
  @override
  _FontSizeChangeScreenState createState() => _FontSizeChangeScreenState();
}

class _FontSizeChangeScreenState extends State<changefontsize> {
  double _fontSize = 20.0;

  void increase() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void decrease() {
    setState(() {
      if (_fontSize > 2.0) {
        _fontSize -= 2.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change font size'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'tasmin',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: increase,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: decrease,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
