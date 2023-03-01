/*
Developer- Gaurav Kamboj
Provider class for creating deleting and updating Todo.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_tutorial/boxes/boxes.dart';
import 'package:hive_tutorial/model/note_model.dart';

class NotesController extends ChangeNotifier{
  

  createNote(title,desc,context){
      NoteModel note=NoteModel(title: title, desc: desc);
                    final box=Boxes.getData();
                    box.add(note);
                    note.save();
                    Navigator.maybePop(context);
  }

  
  deleteNote(NoteModel note)async{
    await note.delete();
    
  }
  

  updateNote(NoteModel note,title,desc,context) async {
     note.title=title;
            note.desc=desc;
            await note.save();
            Navigator.pop(context);
  }


  
}