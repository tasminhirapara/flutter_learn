

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {

  late Database db;

  Future open() async
  {
    //get the database path and create database
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, 'tasmin.db');
    print(path);

    //create table
    db = await openDatabase(
        path, version: 1, onCreate: (Database db, int version) async
    {
      await db.execute('''

                    CREATE TABLE IF NOT EXISTS task( 
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          taskname varchar(255) not null,
                          discription varchar(255) not null,
                          date DATETIME not null,
                          priority text not null,
                          taskcomplete text not null
                          );

                      //create more table here
                  
                  ''');

      print('Table Created');
    });
  }



}


