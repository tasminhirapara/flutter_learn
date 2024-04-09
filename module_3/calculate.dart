import 'package:flutter/material.dart';


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculat the two number',
      home: calculate(),
    );
  }
}

class calculate extends StatefulWidget
{
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<calculate>
{
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String operation = '';
  String result = '';

  void _calculate() {
    double number1 = double.tryParse(num1.text) ?? 0.0;
    double number2 = double.tryParse(num2.text) ?? 0.0;

    setState(()
    {
      switch (operation) {
        case 'Add':
          result = (number1 + number2).toString();
          break;
        case 'Subtraction':
          result = (number1 - number2).toString();
          break;
        case 'Multiply':
          result = (number1 * number2).toString();
          break;
        case 'Division':
          if (number2 != 0) {
            result = (number1 / number2).toString();
          } else {
            result = 'Cannot divide by zero';
          }
          break;
        default:
          result = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
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
                labelText: 'Enter number 1',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number 2',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 'Add',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Add'),
                Radio(
                  value: 'Subtraction',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Subtraction'),

              ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 'Multiply',
                      groupValue: operation,
                      onChanged: (value) {
                        setState(() {
                          operation = value.toString();
                        });
                      },
                    ),
                Text('Multiply'),
                Radio(
                  value: 'Division',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Division'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 18.0),
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
