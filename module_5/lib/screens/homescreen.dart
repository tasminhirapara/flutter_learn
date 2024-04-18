import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqfliteproject/db/dbfile.dart';
import 'package:sqfliteproject/themecolor/colorfile.dart';



class homescreen extends StatefulWidget
{
  final bool isListView;

  const homescreen({super.key,required this.isListView});

  @override
  State<homescreen> createState() => _homescreenState();
}

const List<String> list = ['High', 'Medium', 'Low'];
const List<String> list1 = ['No','Yes'];



class _homescreenState extends State<homescreen>
{
  MyDb db= MyDb();
  List<Map> slist = [];

  @override
  void initState() {
    db.open();
    getdata();
    //super.initState();
  }

 //var currentdate = DateTime.now();



  TextEditingController taskname= TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  bool FilterByDate = true;

  @override
  Widget build(BuildContext context)
  {
  // getdata();
    print(slist.length);
    DateTime now = DateTime.now();
   String currentDate = "${now.year}-${now.month}-${now.day}";
   print(currentDate);
   print(widget.isListView);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center
          (
          child: Expanded(
            child: Column(
              children: [ Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FilterByDate
                          ? "FilterByPriority" : "FilterByDate",
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            FilterByDate = !FilterByDate;
                            if(FilterByDate==false)
                              {
                                filterbydate();
                              }
                            else{
                              getdata();
                            }
                          });
                        },
                        icon: FilterByDate
                            ? const Icon(Icons.priority_high)
                            : const Icon(Icons.filter_list))
                  ],
                ),
              ),
                widget.isListView ?
                SingleChildScrollView(
                    child:GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), 
                      children: slist.map((stuone){
                        _setBackgroundColor(a:stuone["priority"],taskstatus:stuone["taskcomplete"]);
                        if(stuone["date"]==currentDate){
                          expiredate(d:stuone["date"]);
                        }
                        return GestureDetector(
                            child:Card
                              (
                              child: Container(
                                // color: _backgroundColor,
                                decoration: BoxDecoration(
                                  color: _backgroundColor,
                                  borderRadius: BorderRadius.circular(12.0), // Radius for rounded corners
                                ),
                                child: GridTile(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        child: Column(
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
                                            IconButton(onPressed: ()
                                            {
                                              print("Edit");
                                              _showedittaskDialog(context, taskname: stuone["taskname"], discription: stuone["discription"], priority: stuone["priority"], date: stuone["date"],id:stuone["id"]);

                                            }, icon: Icon(Icons.edit)),
                                            IconButton(onPressed: ()
                                            {
                                              print("deleted");
                                              db.db.rawDelete("DELETE FROM task where id = ?",[stuone["id"]]);
                                              getdata();

                                            }, icon: Icon(Icons.delete)),

                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            )

                        );
                      }).toList(),) )



                    : Padding(
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
              ],
            ),
          ),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddtaskDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: primarycolor,
      ),
    );
  }


  String selectedpriority=list.first;

  void _showAddtaskDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: AlertDialog(
                title: Text('Add Task'),
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
                    SizedBox(height: 10,),
                    TextFormField(decoration:InputDecoration(
                      hintText: 'Enter Your Discription',
                      labelText: 'Discription',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),),
                    ),
                      controller: discription,
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
                              date.text =
                                  value.toString().substring(0, 11);
                            }
                          },
                        );
                      },
                      controller: date,
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
                                  date.text =
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
                        initialSelection: list.first,
                        requestFocusOnTap: true,
                        inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder( borderRadius: BorderRadius.circular(10),)),
                        label: const Text('Priority'),
                        onSelected: (String? value) {
                          setState(() {
                            selectedpriority =value!;
                            print(selectedpriority);
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

                          print("1");
                          db.db.rawInsert("INSERT INTO task (taskname, discription, date,priority,taskcomplete) VALUES (?, ?, ?,?,?);",[taskname.text.toString(),discription.text.toString(),date.text.toString(),selectedpriority.toString(),completetask.toString()]);
                          print("2");
                          taskname.text = "";
                          discription.text = "";
                          Navigator.pop(context);
                          getdata();

                        }

                    },
                    child: Text('Add',style: TextStyle(color: Colors.black),),
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

      slist = await db.db.rawQuery('SELECT * FROM task order by priority ASC');

      setState(()
      {


      });
    });

  }
  void filterbydate()
  {
    Future.delayed(Duration(milliseconds: 500),()async
    {

      slist = await db.db.rawQuery('SELECT * FROM task order by date ASC');

      setState(()
      {


      });
    });

  }

  void expiredate({required d})
  {
    db.db.rawDelete("DELETE FROM task where date = ?",[d]);
    getdata();

  }


}
