import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulefoure/q70/audio.dart';
import 'package:modulefoure/q70/gallery.dart';
import 'package:modulefoure/q70/video.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {

  List screens = [gallery(), video(),audio()];
  int selectedIndex = 0;

  void _onItemTapped(int index)
  {
    setState(()
    {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: 'Gallery',
            backgroundColor: Colors.yellow.shade200,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Video',
            backgroundColor: Colors.yellow.shade200,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack_sharp),
            label: 'audio',
            backgroundColor: Colors.yellow.shade200,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,

      ),
      body: screens[selectedIndex],



    );
  }
}
