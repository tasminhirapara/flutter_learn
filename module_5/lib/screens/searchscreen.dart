import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/dbfile.dart';
import '../themecolor/colorfile.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

const List<String> list = ['High', 'Medium', 'Low'];
const List<String> list1 = ['No','Yes'];



class _searchscreenState extends State<searchscreen>
{
  TextEditingController taskname =TextEditingController();

  MyDb db= MyDb();
  List<Map> slist = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    db.open();
    getdata();
    //super.initState();
  }
  MaterialColor _backgroundColor=Colors.red;
  void _setBackgroundColor({required a,required taskstatus}) {
    print(taskstatus);
    print(a);
    setState(() {
      if(taskstatus =="Yes")
      {
        _backgroundColor = Colors.grey;
      }
      else {
        if (a == "High") {
          _backgroundColor = Colors.red;
        }
        else if (a == "Medium") {
          _backgroundColor = Colors.blue;
        }
        else {
          _backgroundColor = Colors.green;
        }
      }


    });
  }

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
          TextFormField(decoration:InputDecoration(
          hintText: 'Search Task',
            labelText: 'TaskName',
            icon: ElevatedButton(onPressed: (){

              getdata();

            }, child: Icon(Icons.search), style:ElevatedButton.styleFrom(
              backgroundColor: primarycolor,
            ),),
            iconColor:Colors.black ,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              ),),
          ),

          controller: taskname,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'please enter your task name';
            }
            return null;
          },
        ),


              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: SingleChildScrollView
                    (
                      child: slist.length == 0 ? Center(child: Text("No any task to show.")) :

                      Column
                        (
                          children: slist.map((stuone)
                          {
                            _setBackgroundColor(a:stuone["priority"],taskstatus:stuone["taskcomplete"]);
                            return Card
                              (
                              child: Container(
                                // color: _backgroundColor,
                                decoration: BoxDecoration(
                                  color: _backgroundColor,
                                  borderRadius: BorderRadius.circular(12.0), // Radius for rounded corners
                                ),
                                child: ListTile
                                  (contentPadding: EdgeInsets.all(16.0),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("TaskName :", style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                          Text(stuone["taskname"], style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        child: Row(
                                          children: [
                                            Text("Discription :", style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                            Text(stuone["discription"], style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("Priority :", style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                          Text(stuone["priority"], style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Date :", style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                          Text(stuone["date"], style: TextStyle(fontSize: 16.0, color: Colors.black,),),
                                        ],
                                      ),
                                    ],
                                  ),

                                  trailing: Wrap(

                                    children: [
                                      IconButton(onPressed: ()
                                      {
                                        print("deleted");
                                        db.db.rawDelete("DELETE FROM task where id = ?",[stuone["id"]]);
                                        getdata();

                                      }, icon: Icon(Icons.delete)),

                                    ],

                                  ),
                                  onTap: (){
                                    _showedittaskDialog(context, taskname: stuone["taskname"], discription: stuone["discription"], priority: stuone["priority"], date: stuone["date"],id:stuone["id"]);

                                  },

                                ),
                              ),

                            );

                          }).toList()

                      )),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }

  String completetask=list1.first;

  void _showedittaskDialog(BuildContext context,{required taskname,required discription,required priority,required date,required id}) {

    TextEditingController utaskname= TextEditingController();
    TextEditingController udiscription = TextEditingController();
    TextEditingController udate = TextEditingController();

    udate.text=date;
    int index = -1;
    list.asMap().forEach((i, element) {
      if (element == priority) {
        index = i;
      }
    });
    String uselectedpriority=list[index];
    utaskname.text=taskname;
    udiscription.text=discription;



    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: AlertDialog(
                title: Text('Edit Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(decoration:InputDecoration(
                      hintText: 'Enter Your Task Name',
                      labelText: 'Task Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),),
                    ),

                      controller: utaskname,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'please enter your task name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(decoration:InputDecoration(
                      hintText: 'Enter Your Discription',
                      labelText: 'Discription',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),),
                    ),
                      controller: udiscription,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'please enter your discription';
                        }
                        return null;
                      },
                    ),


                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024, DateTime.monthsPerYear),
                        ).then(
                              (value) {
                            if (value != null) {
                              udate.text =
                                  value.toString().substring(0, 11);
                            }
                          },
                        );
                      },
                      controller: udate,
                      readOnly: true,
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please Enter Required Fields"
                            : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Select Date",
                        prefixIcon: IconButton(
                          onPressed: () async {
                            await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024, DateTime.monthsPerYear),
                            ).then(
                                  (value) {
                                if (value != null) {

                                  udate.text =
                                      value.toString().substring(0, 11);


                                }
                              },
                            );
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(

                      child: DropdownMenu<String>(
                        initialSelection: list[index],
                        requestFocusOnTap: true,
                        inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder( borderRadius: BorderRadius.circular(10),)),
                        label: const Text('Priority'),
                        onSelected: (String? value) {
                          setState(() {
                            uselectedpriority =value!;
                            print(uselectedpriority);
                          });
                        },
                        dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>(
                                (String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label:value,
                                style: MenuItemButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                              );
                            }).toList(),

                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(

                      child: DropdownMenu<String>(
                        initialSelection: list1.first,
                        requestFocusOnTap: true,
                        inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder( borderRadius: BorderRadius.circular(10),)),
                        label: const Text('Taskcomplete?'),
                        onSelected: (String? value) {
                          setState(() {
                            completetask =value!;
                            print(completetask);
                          });
                        },
                        dropdownMenuEntries:
                        list1.map<DropdownMenuEntry<String>>(
                                (String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label:value,
                                style: MenuItemButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                              );
                            }).toList(),

                      ),
                    ),



                  ],

                ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: Text('Cancel',style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // var name = fullname.text.toString();
                      // var number= mobilenumber.text.toString();
                      // insertdata(name,number);
                      // Add contact
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage())); // Close dialog
                      if(_formKey.currentState!.validate())
                      {
                        print("clicked");
                        db.db.rawUpdate("Update task set taskname=?,discription=?,priority=?,date=?,taskcomplete=? where id=?",[utaskname.text.toString(),udiscription.text.toString(),uselectedpriority.toString(),udate.text.toString(),completetask.toString(),id]);
                        utaskname.text = "";
                        udiscription.text = "";
                        Navigator.pop(context);
                        getdata();

                      }

                    },
                    child: Text('Save',style: TextStyle(color: Colors.black),),
                    style:ElevatedButton.styleFrom(
                      backgroundColor: BackgroundColor,
                    ),
                  ),

                ],
                shadowColor: Colors.black,
                backgroundColor:Colors.white,

              ),


            ),
          ),

        );
      },
    );
  }

  void getdata()
  {
    Future.delayed(Duration(milliseconds: 500),()async
    {

      slist = await db.db.rawQuery('SELECT * FROM task where taskname=?',[taskname.text.toString()]);

      setState(()
      {


      });
    });

  }

}
