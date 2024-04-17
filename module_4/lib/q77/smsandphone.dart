import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class smsandphone extends StatefulWidget {
  const smsandphone({super.key});

  @override
  State<smsandphone> createState() => _smsandphoneState();
}

class _smsandphoneState extends State<smsandphone>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call Example'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80,),
            ElevatedButton(
              onPressed: () {
                Call('+917359044160');
              },
              child: Text('Make Phone Call'),
            ),
            ElevatedButton(
              onPressed: () {
                sms('+917359044160', 'Hello buddy');
              },
              child: Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
  Call(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  sms(String phoneNumber, String message) async {
    String url = 'sms:$phoneNumber?body=$message';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
