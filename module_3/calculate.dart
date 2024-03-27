import 'package:flutter/material.dart';


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  String _operation = '';
  String _result = '';

  void _calculate() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0.0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0.0;

    setState(() {
      switch (_operation) {
        case 'Add':
          _result = (number1 + number2).toString();
          break;
        case 'Subtraction':
          _result = (number1 - number2).toString();
          break;
        case 'Multiply':
          _result = (number1 * number2).toString();
          break;
        case 'Division':
          if (number2 != 0) {
            _result = (number1 / number2).toString();
          } else {
            _result = 'Cannot divide by zero';
          }
          break;
        default:
          _result = '';
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
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number 1',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _number2Controller,
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
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value.toString();
                    });
                  },
                ),
                Text('Add'),
                Radio(
                  value: 'Subtraction',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value.toString();
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
                      groupValue: _operation,
                      onChanged: (value) {
                        setState(() {
                          _operation = value.toString();
                        });
                      },
                    ),
                Text('Multiply'),
                Radio(
                  value: 'Division',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value.toString();
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
              'Result: $_result',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }
}
