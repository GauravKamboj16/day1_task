 import 'package:day1_task/services/DatabaseHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../Model/ChatModel.dart';

class MessageController with ChangeNotifier {
  var tableName;

   void getCount(var table){
    this.tableName=table;
   }


  final dbHandler= DatabaseHandler();
  dynamic loadMessages() async {
    await  dbHandler.retrieveUsers(tableName);
    notifyListeners();
  }

  Future<void> removeItem(AsyncSnapshot snapshot,int index) async {
     await  dbHandler.deleteUser(snapshot.data![index].id!,tableName);
     print(snapshot.data[index].id);
    snapshot.data!.remove(snapshot.data![index]);
    notifyListeners();
  }

     Future<void> editMessage(AsyncSnapshot snapshot,int indx,ChatModel modl) async {  
      await dbHandler.editUser(snapshot.data[indx].id, tableName,modl);
      notifyListeners();
  }


  Future<void> addMessage(String  text) async {
                 DateTime now = DateTime.now();
                 String formattedDate = DateFormat('kk:mm').format(now);
                final chat=ChatModel(message:text,time: formattedDate.toString());
                 List<ChatModel> listOfUsers = [chat];
                await dbHandler.insertUser(listOfUsers,tableName);
               notifyListeners();
  }




 }