import 'package:day1_task/Constants/AppColors.dart';
import 'package:day1_task/Widgets/ChatRoomItem.dart';
import 'package:day1_task/services/DatabaseHandler.dart';
import 'package:day1_task/modules/view/messageDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatrooms",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.whiteColor,),
      ),
      backgroundColor: AppColors.headingBack,
      ),

      body: SafeArea(
        child:  Expanded(
          flex: 1,
          child: ListView.separated(
            itemCount: 4,
            itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MessageDetail(index: index.toString());
                }));
              },
              child:ItemDesign(index:index,));
          }, separatorBuilder: (BuildContext context, int index) { 
            return SizedBox(height: 3,);
           },),
        )),
    );
  }
}