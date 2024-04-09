import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class seconscreen extends StatefulWidget {
  const seconscreen({super.key});

  @override
  State<seconscreen> createState() => _seconscreenState();
}

class _seconscreenState extends State<seconscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secondscreen"),),
      
      body: Column(
        children: [
          Container(alignment: Alignment.center,
              child: Image.asset("images/nature.jpeg",fit: BoxFit.fill,height: 220,)),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("nature and its beauty",style: TextStyle(color: Colors.black,fontSize: 20),),
                    Text("nature and its beauty",style: TextStyle(color: Colors.grey,fontSize: 20,),)
                  ],
                ),
                SizedBox(
                  width: 160,
                ),
                Container(
                    child: Icon(Icons.star,color: Colors.yellow,))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Container(child: Column(children: [Icon(Icons.call,color: Colors.blue,),Text("call",style: TextStyle(color: Colors.blue),)],),),
                    SizedBox(width: 80,),
                    Container(child: Column(children: [Icon(Icons.route,color: Colors.blue,),Text("call",style: TextStyle(color: Colors.blue))],),),
                     SizedBox(width: 80,),
                    Container(child: Column(children: [Icon(Icons.share,color: Colors.blue,),Text("call",style: TextStyle(color: Colors.blue))],),),
                  ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("It's about capturing the essence of the environment and its creatures, telling stories of individual animals, diverse ecosystems, and intricate patterns in flowers"),
          )
        ],
      ),
      
    );
    
  }
}
