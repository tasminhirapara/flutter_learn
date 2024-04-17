import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'displaysum.dart';

class sumofnumber extends StatefulWidget {
  const sumofnumber({super.key});

  @override
  State<sumofnumber> createState() => _sumofnumberState();
}

class _sumofnumberState extends State<sumofnumber>
{
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      appBar: AppBar(title: Text('sum of two numbers'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first Number '),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter  second Number '),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => display(
                      num1: int.tryParse(num1.text) ?? 0,
                      num2: int.tryParse(num2.text) ?? 0,
                    ),),);},
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}
