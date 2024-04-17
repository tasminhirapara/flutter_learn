import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulefoure/uidesign/cartscreen.dart';
import 'package:modulefoure/uidesign/foodlistscreen.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
{
  List screens = [foodscreen(), cartscreen(),];
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
    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Home',
            backgroundColor: Colors.yellow.shade200,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Search',
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
