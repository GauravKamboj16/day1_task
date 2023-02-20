 import 'package:day1_task/modules/services/DatabaseHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../Model/ChatModel.dart';

class MessageController with ChangeNotifier {
  final dbHandler= DatabaseHandler("Db1");
  dynamic loadMessages() async {
    await  dbHandler.retrieveUsers();
    notifyListeners();
  }

  Future<void> removeItem(AsyncSnapshot snapshot,int index) async {
     await this.dbHandler.deleteUser(snapshot.data![index].id!);
    snapshot.data!.remove(snapshot.data![index]);
    notifyListeners();
  }

  Future<void> addMessage(String  text) async {
                 DateTime now = DateTime.now();
                 String formattedDate = DateFormat('kk:mm').format(now);
                final chat=ChatModel(message:text,time: formattedDate.toString());
                 List<ChatModel> listOfUsers = [chat];
                await dbHandler.insertUser(listOfUsers);
               notifyListeners();
  }




 }