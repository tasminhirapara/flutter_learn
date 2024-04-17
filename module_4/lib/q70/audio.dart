import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("data of  audio")));
  }
}
