import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/modules/controller/notes_controller.dart';

import '../Constant/app_colors.dart';
import '../model/note_model.dart';

class EditDialog extends StatelessWidget {
  final NoteModel note;
  final String title;
  final String desc;
  final NotesController controller;
  const EditDialog({super.key, required this.note, required this.title, required this.desc, required this.controller});

  @override
  Widget build(BuildContext context) {
    // return Future<void> showEditDialogue(NoteModel note,String title,String desc){
    final titleController=TextEditingController(text: title);
    final descController=TextEditingController(text: desc);
    return  Card( 
        color: AppColors.backgroundColor,
        child:
       Column(
        children: [
          SizedBox(height: 23,),
          TextField(
                  controller: titleController,
                  style: GoogleFonts.poppins(color:Colors.white,fontSize: 16,fontWeight:FontWeight.w500),
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
                  style: GoogleFonts.poppins(color:Colors.white,fontSize: 12,fontWeight:FontWeight.w400),
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
                SizedBox(height: 25,),
                 GestureDetector(
                 onTap: (){
            // controller.updateNote(note, title, desc, context);
               controller.updateNote(note, titleController.text.toString(), descController.text.toString(), context);
             
            
          


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
                        child: Text('update',style: GoogleFonts.lato(color:Colors.white,fontSize: 22,fontWeight:FontWeight.w600),),
                      ),
                    ),
                 ),
          

        ],
       )
       ,);

      }
  }
