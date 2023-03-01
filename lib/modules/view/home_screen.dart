import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/modules/controller/theme_controller.dart';
import 'package:hive_tutorial/modules/view/Products_screen.dart';
import 'package:hive_tutorial/modules/view/notes_list.dart';
import 'package:hive_tutorial/services/notification_service.dart';
import 'package:hive_tutorial/widgets/card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService service = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.requestNotificationPermission();
    service.firebaseInit();
    service.initNotification();
    service.getDeviceToken().then((value) => print(value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ThemeController>(context);

    void _onTodoClicked() async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const NotesList()));
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onProductClicked() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProductsScreen()));
    }

    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        //backgroundColor: AppColors.redColor,
        title: Text("Todo App"),
        actions: [
          IconButton(
              onPressed: () {
                controller.setTheme(controller.themeMode);
              },
              icon: Icon(controller.icon))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          ItemCard(
            "Todo",
            _onTodoClicked,
          ),
          SizedBox(
            height: 32,
          ),
          ItemCard(
            "Products",
            _onProductClicked,
          ),
          Spacer()
        ],
      )),
    );
  }
}
