import 'package:day1_task/Model/ChatModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler { 
    Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Chat Rooms'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE group0(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL,time TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE group1(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL,time TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE group2(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL,time TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE group3(id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL,time TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }
   Future<int> insertUser(List<ChatModel> users,var tableName) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert(tableName, user.toMap());
    }
   return result;
    
  }

Future<List<ChatModel>> retrieveUsers(var tableName) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(tableName);
    var result=queryResult.map((e) => ChatModel.fromMap(e)).toList();
    print(result.length);
    return result;
  }

  Future<void> deleteUser(int id,var tableName) async {
    final db = await initializeDB();
    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> editUser(int id,var tableName,ChatModel chat) async {
    final db = await initializeDB();
    await db.update(
      tableName,
      chat.toMap(),          
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<ChatModel> retrieveLastItem() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("group0");
    List<ChatModel> result=queryResult.map((e) => ChatModel.fromMap(e)).toList();
    print("GAurav ${result.last.toMap()}");
    return ChatModel(message: result.last.message, time: result.last.time);

  }

}