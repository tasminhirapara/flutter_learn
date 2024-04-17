import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../q70/bottomnav.dart';

class splashscreen extends StatefulWidget
{
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 4),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>bottomnav())));
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Lottie.asset("images/Animation.json",),
      ),
    );
  }
}

