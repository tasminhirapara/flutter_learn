import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modulefoure/uidesign/fooddesign.dart';

class foodscreen extends StatefulWidget
{
  const foodscreen({super.key});

  @override
  State<foodscreen> createState() => _foodscreenState();
}

final List<Map<String, dynamic>> dataList = [
  {'name': 'Apple', 'image': 'images/apple.jpg','prize': '13.50'},
  {'name': 'AWS', 'image': 'images/aws.jpg','prize': '13.50'},
  {'name': 'Intel', 'image': 'images/intel.jpg','prize': '13.50'},
  {'name': 'Flutter', 'image': 'images/flutter.png','prize': '13.50'},
  {'name': 'Mongodb', 'image': 'images/mongodb.png','prize': '13.50'},
  {'name': 'React', 'image': 'images/react.png','prize': '13.50'},
];

class _foodscreenState extends State<foodscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child:  Column(
            children: [
              Row(
                children: [
                  Text("Menu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Spacer(),// to uses for maintain space b/w  two element
                  IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context,
                        builder:(context){
                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                          children: [
                                            Divider(height: 40,indent: 100,endIndent: 100,thickness: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Your Order', style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Icon(Icons.food_bank, size: 25,)
                                              ],
                                            ),
                                      ListTile(
                                        title: Text(
                                          "Chiken Burger",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text("250g"),
                                        trailing: Text('\$7.00',
                                          style:TextStyle(fontSize: 16),
                                        ),
                                      ),
                                            ListTile(
                                              title: Text(
                                                "Avacado Salad",
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text("350g"),
                                              trailing: Text('\$5.22',
                                                style:TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Total",
                                                  style: TextStyle(fontSize: 18, color: Colors.grey),),
                                                Text('\$12.22',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                            ElevatedButton(
                                              onPressed: () {

                                                },
                                              child: const Text('Add to Cart',style: TextStyle(color: Colors.black),),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.yellow)
                                              ),
                                            ),
                                            
                                          ],

                                      ),
                                    );
                    }
                    );
                    }, icon: Icon(Icons.filter_alt_outlined))
                ],
              ),
                Container(
          height: 60,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: ChoiceChip(
                  showCheckmark: false,
                  label: Text('items'),
                  selected: true,
                  selectedColor: Colors.yellow,
                  onSelected: (value) {},
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            physics:BouncingScrollPhysics(),
            itemCount: 8,
          ),
                ),
              Container(
                height: 40,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("All")
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  physics:BouncingScrollPhysics(),
                  itemCount: 20,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  physics: const BouncingScrollPhysics(),
                     children: List.generate(dataList.length, (index) => fooddesign(image: dataList[index]['image'],name: dataList[index]['name'],price: dataList[index]['prize'],),),

                    ),
              ),
            ],
          ),

      ),
    );
  }
}
