import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class callpermision extends StatefulWidget {
  const callpermision({super.key});

  @override
  State<callpermision> createState() => _callpermisionState();
}

class _callpermisionState extends State<callpermision> {
  void initState() {
    super.initState();
    Permissionsdialog();
  }
  Future<void> Permissionsdialog() async
  {
    var status = await Permission.phone.request();
    if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Request for permission"),
            content: Text("give me a permissiones for phone call"),
            actions: [
              TextButton(child: Text("Deny"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(child: Text("Allow"),
                onPressed: () async {
                await openAppSettings();
                Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(child: Text("permision for phone call"),),
    );
  }
}
