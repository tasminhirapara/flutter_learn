import 'package:flutter/material.dart';



class ImageAround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageAround ',
      home: Imagetext(),
    );
  }
}

class Imagetext extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageAroundText'),
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
