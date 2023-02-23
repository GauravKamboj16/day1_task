import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_tutorial/boxes/boxes.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/model/note_model.dart';
import 'package:hive_tutorial/modules/controller/notes_controller.dart';
import 'package:hive_tutorial/modules/view/create_note.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  late NotesController controller;
   

  @override
  Widget build(BuildContext context) {
      controller=Provider.of<NotesController>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
       appBar: AppBar(
        title: const Text("Create TODO"),
        backgroundColor: AppColors.redColor,
      ),
      body: ValueListenableBuilder<Box<NoteModel>>(
        valueListenable: Boxes.getData().listenable(),
         builder: (context, box, child) {
          var data=box.values.toList().cast<NoteModel>();
          return data.length==0?
           Center(child: Text("No notes add now",style: GoogleFonts.notoSans (color: Colors.white,fontSize: 25),))
          :ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return Card(
              color: AppColors.cardColor,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.elementAt(index).title,style: GoogleFonts.poppins(color:Colors.white,fontSize: 19,fontWeight: FontWeight.w600),),
                          Text(data.elementAt(index).desc,style: GoogleFonts.poppins(color:Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      showEditDialogue(data[index], data[index].title, data[index].desc,);

                    }, icon: Icon(Icons.edit,color: Colors.green,)),
                    IconButton(onPressed: (){
                      controller.deleteNote(data[index]);

                    }, icon: Icon(Icons.delete,color: Colors.red,)),
                  ],
                ),
              ),
            );
          });
           
         },),

         floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CreateNote();

          }));
         },
         child: const Icon(Icons.add),
         ),


    );
  }
  
Future<void> showEditDialogue(NoteModel note,String title,String desc){
    final titleController=TextEditingController(text: title);
    final descController=TextEditingController(text: desc);
    return 
    showDialog(context: context,
     builder: (context) {
       return Card( 
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
     },);
  }

}