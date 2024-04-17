import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menucontex extends StatefulWidget
{
  const menucontex({super.key});

  @override
  State<menucontex> createState() => _menucontexState();
}

class _menucontexState extends State<menucontex>
{
  List<String> menuitems = ['tasmin', 'smit', 'kanak', 'priyansh', 'shubham'];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("contex menu"),),
    body: ListView.builder(
    itemCount: menuitems.length,
    itemBuilder: (context, index) {
      return ListTile(
  title: Text( menuitems[index]),
    onLongPress: () {
  Menu(context,  menuitems[index]);
  },
  );
  },
    ),
    );
  }
  void Menu(BuildContext context, String item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              ListTile(leading: Icon(Icons.edit), title: Text('Edit'),
                onTap: ()
                {print('Edit: $item');
                Navigator.pop(context);},
              ),
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text('View'),
                onTap: () {
                  print('View: $item');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  setState(() {
                    menuitems.remove(item);
                  });
                  print('Delete: $item');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
