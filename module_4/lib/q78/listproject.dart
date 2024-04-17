import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listproject extends StatefulWidget {
  const listproject({super.key});

  @override
  State<listproject> createState() => _listprojectState();
}

class _listprojectState extends State<listproject>
{
  final List<String> items = [];
  TextEditingController editc = TextEditingController();
  String selectedItems = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListProject'),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  onTap: () {
                    namedialog(items[index]);
                  },
                  onLongPress: () {
                    ContextMenu(items[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(labelText: 'enter your names'),
              onSubmitted: (value) {
                setState(() {
                  add(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  void add(String name) {
    if (name.isNotEmpty) {
      items.add(name);
    }
  }

  void namedialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('selected name'),
          content: Text('you selected: $name'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void ContextMenu(String selectedItem) {
    selectedItems = selectedItem;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, 0),
      items: [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              edit();
            },
            child: Text('Edit'),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              delete();
            },
            child: Text('Delete'),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  void edit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('edit name'),
          content: TextField(
            controller: editc,
            decoration: InputDecoration(labelText: 'enter name'),
          ),
          actions: [
            TextButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('save'),
              onPressed: () {
                setState(() {
                  if (editc.text.isNotEmpty) {
                    int index = items.indexOf(selectedItems);
                    if (index != -1) {
                      items[index] = editc.text;
                      editc.clear();
                      Navigator.of(context).pop();
                    }
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  void delete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete name'),
          content: Text('are you sure want to delete $selectedItems?'),
          actions: [
            TextButton(child: Text('No'), onPressed: () {Navigator.of(context).pop();},
            ),
            TextButton(child: Text('Yes'), onPressed: () {setState(() {items.remove(selectedItems);
              Navigator.of(context).pop();});
              },
            ),
          ],
        );
      },
    );
  }
}
