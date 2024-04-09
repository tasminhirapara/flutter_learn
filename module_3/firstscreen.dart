import 'package:flutter/material.dart';



class firstscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'firstscreen',
      home: GridAndListViewScreen(),
    );
  }
}

class GridAndListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid and List View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      color: Colors.red,
                      child: Center(

                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildRowWithTwoImages(),
            buildRowWithTwoImages(),
            buildRowWithThreeImages(),
            buildRowWithThreeImages(),
          ],
        ),
      ),
    );
  }

  Widget buildRowWithTwoImages() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Expanded(

            child: Container(
              height: 150,
              color: Colors.blue,
              child: Center(

              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              height: 150,
              color: Colors.blue,
              child: Center(

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowWithThreeImages() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(

              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(

              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(

              ),
            ),
          ),
        ],
      ),
    );
  }
}
