import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class lifecycle extends StatefulWidget {
  const lifecycle({super.key});

  @override
  State<lifecycle> createState() => _lifecycleState();
}

class _lifecycleState extends State<lifecycle>
{
  void initState() {
    super.initState();
    toastmessage("onCreate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    toastmessage("onStart");
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("lifecycles of activitys"),),
      body: Center(child: ElevatedButton(onPressed: () {},
          child: Text("activity"),
        ),
      ),
    );
  }
void deactivate() {
  toastmessage("onPause");
}
@override
void dispose() {
  toastmessage("onDestroy");
}
void toastmessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
}
