import 'package:flutter/material.dart';



class ImageAroundTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Around Text App',
      home: ImageAroundTextScreen(),
    );
  }
}

class ImageAroundTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Around Text App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/nature.jpeg', width: 50, height: 50),
                SizedBox(width: 20),
                Text(
                  'This is the TextView',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 20),
                Image.asset('images/nature.jpeg', width: 50, height: 50),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/nature.jpeg', width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
