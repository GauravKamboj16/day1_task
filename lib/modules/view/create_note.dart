 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/Constant/app_colors.dart';
import 'package:provider/provider.dart';
import '../controller/notes_controller.dart';
 

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
final titleController=TextEditingController();
final descController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<NotesController>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Create TODO"),
        backgroundColor: AppColors.redColor,
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 35,),
                TextField(
                  controller: titleController,
                  style: GoogleFonts.poppins(color:Colors.white,fontSize: 18,fontWeight:FontWeight.w500),
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: Text('Title'),
                    labelStyle: GoogleFonts.lato(color: AppColors.whiteColor,),
                    fillColor: AppColors.cardColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                        width: 2,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                        width: 2,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: descController,
                  style: GoogleFonts.poppins(color:Colors.white,fontSize: 15,fontWeight:FontWeight.w400),
                  maxLines: 8,
                  decoration: InputDecoration(
                    label: const Text('Description'),
                    labelStyle: GoogleFonts.lato(color: AppColors.whiteColor,),
                    fillColor: AppColors.cardColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                        width: 2,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: AppColors.redColor,
                        width: 2,
                      )
                    ),
                  ),
                ),
      
                SizedBox(height: 22,),
                GestureDetector(
                  onTap: () async {

                    if(titleController.text == "" || titleController.text ==""){
                      
                    }else{
                      controller.createNote(titleController.text.toString()
                    , descController.text.toString(), context);
                    
                    }

               
                  

                  },
                  child: Container(
                    height:55,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 2
                      )
                      
                    ),
                    child: Center(
                      child: Text('Save',style: GoogleFonts.lato(color:Colors.white,fontSize: 22,fontWeight:FontWeight.w600),),
                    ),
                  ),
                )
      
              ],
            ),
          ) ),
      ),
    );
  }
}