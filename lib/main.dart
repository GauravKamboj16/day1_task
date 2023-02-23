import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutorial/modules/controller/products_controller.dart';
import 'package:hive_tutorial/modules/view/Products_screen.dart';
import 'package:hive_tutorial/modules/view/create_note.dart';
import 'package:hive_tutorial/modules/view/home_screen.dart';
import 'package:hive_tutorial/modules/view/notes_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'model/note_model.dart';
import 'modules/controller/notes_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox<NoteModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>NotesController()),
        ChangeNotifierProvider(create: (_)=>ProductController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

