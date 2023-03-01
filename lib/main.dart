import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tutorial/modules/controller/products_controller.dart';
import 'package:hive_tutorial/modules/controller/theme_controller.dart';
import 'package:hive_tutorial/modules/view/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'model/note_model.dart';
import 'modules/controller/notes_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundNotificationService);
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _backgroundNotificationService(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: Builder(builder: (context) {
        var themeChanger = Provider.of<ThemeController>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              primarySwatch: Colors.red, brightness: Brightness.light),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
