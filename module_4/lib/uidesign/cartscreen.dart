import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartscreen extends StatefulWidget {

  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}
final List<Map<String, dynamic>> dataList = [
  {'name': 'Apple', 'image': 'images/apple.jpg','prize': '13.50'},
  {'name': 'AWS', 'image': 'images/aws.jpg','prize': '13.50'},
  {'name': 'Intel', 'image': 'images/intel.jpg','prize': '13.50'},
  {'name': 'Flutter', 'image': 'images/flutter.png','prize': '13.50'},
  {'name': 'Mongodb', 'image': 'images/mongodb.png','prize': '13.50'},
  {'name': 'React', 'image': 'images/react.png','prize': '13.50'},
];

class _cartscreenState extends State<cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Row(
                children: [
                  IconButton(onPressed:(){}, icon:  Icon(Icons.chevron_left,size: 40,),alignment: Alignment.topLeft,),
                ],
              ),
              SafeArea(child: Row(
              children: [Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text("Cart", style: TextStyle(fontSize: 20),),
              )],)),
                  Expanded(child:
                  Column(children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    dataList[index]['image'], width: 55, height: 55,
                                    fit: BoxFit.cover,)),
                              title: Column(
                                children: [
                                  Text(dataList[index]['name']),
                                  Row(
                                    children: [
                                      SizedBox(width: 60,),
                                      Icon(Icons.keyboard_double_arrow_left_sharp),
                                      Text("3"),
                                      Icon(Icons.keyboard_double_arrow_right_sharp),
                                    ],
                                  )
                                ],
                              ),
                              trailing: Column(mainAxisSize: MainAxisSize.min,
                                children: [Text('\$${dataList[index]['prize']}'),
                                  Card(
                                  margin: EdgeInsets.only(right: 0),
                                  shape: RoundedRectangleBorder(),
                                  color: Colors.yellow,
                                  child: InkWell(
                                    onTap: (){},
                                    splashColor: Colors.white70,
                                    customBorder:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    child: Icon(Icons.add),
                                  ),
                                )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: TextStyle(fontSize: 30),),
                        Text('\$45.76', style: TextStyle(fontSize: 30),),
                      ],
                    ),
                    ElevatedButton(onPressed: () {  },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                    child: Container(height: 55,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                        ),
                        child: Center(
                          child: Text("Checkout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ])

                  )



                ],
              ),



    );
  }
}
