import 'package:hive/hive.dart';
import 'package:hive_tutorial/model/note_model.dart';

class Boxes{

  static Box<NoteModel> getData()=>Hive.box<NoteModel>('notes');
}