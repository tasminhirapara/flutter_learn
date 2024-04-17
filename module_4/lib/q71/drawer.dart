import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../q70/audio.dart';
import '../q70/gallery.dart';
import '../q70/video.dart';

class navdrawer extends StatefulWidget
{
  const navdrawer({super.key});

  @override
  State<navdrawer> createState() => _navdrawerState();
}

class _navdrawerState extends State<navdrawer>
{

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),titleSpacing: 00.0,
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
        ),backgroundColor: Colors.white,
        elevation: 0.00,
      ),
      body: screens[selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(

              accountName: Text("tasmin hirapara"),
              accountEmail: Text("tasminhirapara@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:Colors.white,
                child: Text("T",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.white),

            ),

            ListTile(
              leading: Icon(Icons.home), title: Text("gallery"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);

              },
            ),
            ListTile(
              leading: Icon(Icons.person), title: Text("video"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout), title: Text("audio"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),

          ],
        ),
      ),

    );
  }
}
