import 'package:day1_task/modules/Constants/AppColors.dart';
import 'package:day1_task/modules/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatItem extends StatelessWidget {
  final ChatModel item;
  const ChatItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
         color: AppColors.mesageBack,
         borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight:  Radius.circular(12),
          bottomRight: Radius.circular(12),
          
         )

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
          //   Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: AppColors.iconBackground,
          //       width: 1
          //     )
          //   ),
          //   child: CircleAvatar(
          //     backgroundColor: AppColors.cardColor,
          //     child: Icon(Icons.person),),
          // ),
          SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('you',style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 16,fontWeight: FontWeight.w600),),
                  
               Text(this.item.message,style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 16,fontStyle: FontStyle.italic),)
              ],
            ),
            Spacer(),
             Text(this.item.time.toString(),style: GoogleFonts.lato(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}