import 'package:day1_task/Constants/AppColors.dart';
import 'package:day1_task/Model/ChatModel.dart';
import 'package:day1_task/modules/controller/MessagingController.dart';
import 'package:day1_task/services/DatabaseHandler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../Widgets/ChatItem.dart';

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
     controller2.tableName="group${this.widget.index}";
    controller2.dbHandler.initializeDB();
    handler=DatabaseHandler();
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
         padding: const EdgeInsets.all(8.0),
         child: Consumer<MessageController>(
          builder: (context, value, child) {
          return FutureBuilder(
             future: controller2.dbHandler.retrieveUsers("group${this.widget.index}"),
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
                              
                              
                              child:GestureDetector(
                                 onLongPress: () {
                                  ChatModel model=ChatModel(id:snapshot.data![index].id!,message: "Edited", time: "Time");
                                //   print("The index is $index, model is ${model.message}");
                                 // value.editMessage(snapshot, index, model);
                              
                                 showDialog(context: context, builder: (BuildContext context) => showEditDialog(snapshot.data!.elementAt(index).message,
                                 snapshot,index));
                                 },
                                child: ChatItem(item: item))
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


Widget showEditDialog(String mssg,AsyncSnapshot snapshot, int index,){
  final mssgController=TextEditingController(text: mssg);
      return Consumer<MessageController>(
        builder: (context, value, child) {
       return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
          height: 300.0,
          width: 300.0,
         
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(15.0),
            child: mTextField(mssgController)
          ),
          
          Padding(padding: EdgeInsets.only(top: 50.0)),
          TextButton(onPressed: () async {
            DateTime now = DateTime.now();
            String time = DateFormat('kk:mm').format(now);
            ChatModel model=await ChatModel(id:snapshot.data.elementAt(index).id,message: mssgController.text, time: time);
            value.editMessage(snapshot, index, model);
            Navigator.of(context).pop();
      
          },
              child: Text('Update!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
        ],
          ),
        ),
      );
         
        },
  
      );
  }


  Widget mTextField(TextEditingController mCont){
    return   TextField(
                    
                controller: mCont,
                style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Type your message',
                  hintStyle: TextStyle(color: AppColors.whiteColor),
                  fillColor: AppColors.textFieldColor,
                  filled: true,
                 
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.iconBackground)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.iconBackground)
                  ),
                ),
               );
  }
}