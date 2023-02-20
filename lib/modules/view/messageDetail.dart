import 'package:day1_task/modules/Constants/AppColors.dart';
import 'package:day1_task/modules/Model/ChatModel.dart';
import 'package:day1_task/modules/controller/MessagingController.dart';
import 'package:day1_task/modules/services/DatabaseHandler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
 

import '../Widgets/ChatItem.dart';

class MessageDetail extends StatefulWidget {
  final String?  index;
    MessageDetail({super.key,@required this.index});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  final messageController=TextEditingController();
 // final dbHandler= DatabaseHandler("Db1");

  late DatabaseHandler handler;
  late MessageController controller2;

  @override
  void initState() {
    super.initState();
     controller2=Provider.of<MessageController>(context,listen: false);
    controller2.dbHandler.initializeDB();
    handler=DatabaseHandler("ChatRoom+${this.widget.index}");
    controller2.loadMessages();
     
  
  }
  @override
  Widget build(BuildContext context) {
    // final controller=Provider.of<MessageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.whiteColor,),
      ),
      backgroundColor: AppColors.headingBack,
      ),
       body: Padding(
         padding: const EdgeInsets.all(.0),
         child: Consumer<MessageController>(
          builder: (context, value, child) {
          return FutureBuilder(
             future: controller2.dbHandler.retrieveUsers(),
            builder: (BuildContext context, AsyncSnapshot<List<ChatModel>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: 
                         ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item=ChatModel(message:snapshot.data![index].message, time: snapshot.data![index].time);
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Icon(Icons.delete_forever),
                              ),
                              key: ValueKey<int>(snapshot.data![index].id!),
                              onDismissed: (DismissDirection direction) async {
                                value.removeItem(snapshot, index);
                              },
                              
                              
                              child:ChatItem(item: item)
                            );
                          }, separatorBuilder: (BuildContext context, int index) { 
                            return SizedBox(height: 12,);
                           },
                        ) 
                      ),
                    
                    TextField(
                    
                controller: messageController,
                style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(color: AppColors.whiteColor),
                  fillColor: AppColors.textFieldColor,
                  filled: true,
                  suffixIcon: IconButton(icon: Icon(Icons.send),onPressed: () async {
                    await value.addMessage(messageController.text.toString());
                    messageController.text="";
                    
                   
         
                  },),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.iconBackground)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.iconBackground)
                  ),
                ),
               )
           
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
               );
                 
          },
         ),
       ),
     

    );
  }
}