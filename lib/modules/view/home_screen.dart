import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/modules/view/Products_screen.dart';
import 'package:hive_tutorial/modules/view/notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        title: Text("Todo App"),
        
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32,),
            GestureDetector(
               onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotesList()));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Center(
                  child: Text("Todo app",style: GoogleFonts.poppins(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            SizedBox(height: 32,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Center(
                  child: Text("Products Cart",style: GoogleFonts.poppins(color: AppColors.whiteColor,fontSize: 22,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
          ],

        ) 
      ),
    );
  }
}