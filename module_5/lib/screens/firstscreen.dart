import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteproject/screens/homescreen.dart';
import 'package:sqfliteproject/screens/searchscreen.dart';
import 'package:sqfliteproject/themecolor/colorfile.dart';

class firstscreen extends StatefulWidget
{
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen>
{
  int selectedIndex = 0;

  void _onItemTapped(int index)
  {
    setState(()
    {
      selectedIndex = index;
    });
  }


  bool isListView = false;

  @override
  Widget build(BuildContext context)
  {

    List screens = [homescreen(isListView: isListView,), searchscreen(),];


    return Scaffold(

      appBar: AppBar(
        title: Text('TASK MANAGMENT'),
        titleSpacing: 00.0,
        centerTitle: true,
        bottomOpacity: 1.0,
        toolbarHeight: 60.2,
        shadowColor: Colors.black,
        toolbarOpacity: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            )
        ),
        backgroundColor: primarycolor,
        elevation: 0.00,
        actions:
        [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            icon: isListView
                ? const Icon(Icons.grid_on)
                : const Icon(Icons.list),
          )

        ],
      ),
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: primarycolor,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: primarycolor,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,

      ),
    );
  }
}
