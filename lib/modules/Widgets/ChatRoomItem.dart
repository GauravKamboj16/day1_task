import 'package:day1_task/modules/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDesign extends StatelessWidget {
  final index;
  const ItemDesign({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

      color: AppColors.Message_listing_background_color,
     child: Padding(
       padding: const EdgeInsets.all(12.0),
       child: Row(
         children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.iconBackground,
              width: 1
            )
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.cardColor,
            child: Icon(Icons.person),),
        ),
        SizedBox(width: 6,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,     
            children: [
             Text("Name $index",style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 16,fontWeight: FontWeight.w600),),
             Text("Meaasage",style: GoogleFonts.lato(color: AppColors.whiteColor,fontSize: 16,fontStyle: FontStyle.italic),)
            ],
           ),
           Spacer(),
           Column(
            children: [
              Text("1:30",style: GoogleFonts.lato(color: Colors.white),),
             Container(
               height:20,
                width:20,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
               
               ),
              child: Center(child: Text("4",style: GoogleFonts.poppins(fontSize:16,color: Colors.white),)))
            ],
           )
         ],
       ),
     ),
         );
  }
}