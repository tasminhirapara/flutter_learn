import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class gmailclone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Material(
              elevation: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Mail",
                  border: InputBorder.none,
                  icon: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: IconButton(onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    }, icon: Icon(Icons.dehaze),),

                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/profile.jpg"),
                    ),
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                100,
                    (int i) {
                  return _listItem(i);
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text('Gmail',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('All indboxes'),
                onTap: () {},
                leading: Icon(Icons.image_outlined),
              ),
              Divider(),
              ListTile(
                title: Text('Primary'),
                onTap: () {},
                leading: Icon(Icons.paste_sharp),
              ),
              ListTile(
                title: Text('Promotions'),
                onTap: () {},
                leading: Icon(Icons.label_outlined),
              ),
              ListTile(
                title: Text('Socials'),
                onTap: () {},
                leading: Icon(Icons.perm_contact_calendar_outlined),
              ),
              ListTile(
                title: Text('Upadetes'),
                onTap: () {},
                leading: Icon(Icons.assignment_late_outlined),
              ),
              ListTile(
                title: Text('Forums'),
                onTap: () {},
                leading: Icon(Icons.mark_as_unread_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(int i) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(i.toString()),
        backgroundColor: Colors.green,
      ),
      title: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "shogo.yamada",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "8:59",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            "Please Subscribe this channel!!!!! Please!!!!!",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("this is gmail app using flutter !!!!!"),
          Icon(Icons.star_border)
        ],
      ),
    );
  }
}