import 'package:day1_task/modules/Model/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  var databaseName;

  DatabaseHandler(String dbName){
    this.databaseName=dbName;
  }
 
 

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, this.databaseName),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL,time TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }
   Future<int> insertUser(List<ChatModel> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){

      result = await db.insert('users', user.toMap());
    }
    print(result);
    return result;
    
  }

Future<List<ChatModel>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    var result=queryResult.map((e) => ChatModel.fromMap(e)).toList();
    print(result.length);
    return result;
    
  }
  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}