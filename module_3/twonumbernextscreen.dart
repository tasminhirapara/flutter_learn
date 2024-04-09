import 'package:flutter/material.dart';



class NumberRange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numberrange',
      home: NumberInput(),
    );
  }
}

class NumberInput extends StatefulWidget {
  @override
  _NumberInputScreenState createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInput> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  void showNumberRange(BuildContext context) {
    int firstNumber = int.tryParse(num1.text) ?? 0;
    int secondNumber = int.tryParse(num2.text) ?? 0;

    if (firstNumber != null && secondNumber != null) {
      List<int> numbers = [];
      if (firstNumber <= secondNumber) {
        for (int i = firstNumber; i <= secondNumber; i++) {
          numbers.add(i);
        }
      } else {
        for (int i = secondNumber; i <= firstNumber; i++) {
          numbers.add(i);
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NumberRangeScreen(numbers: numbers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numberange'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller:  num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => showNumberRange(context),
              child: Text('Show Number Range'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    num1.dispose();
    num2.dispose();
    super.dispose();
  }
}

class NumberRangeScreen extends StatelessWidget {
  final List<int> numbers;

  NumberRangeScreen({required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Range'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(numbers[index].toString()),
            );
          },
        ),
      ),
    );
  }
}
