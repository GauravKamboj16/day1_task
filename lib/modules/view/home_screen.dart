import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_tutorial/constant/app_colors.dart';
import 'package:hive_tutorial/modules/controller/theme_controller.dart';
import 'package:hive_tutorial/modules/view/MusicAnimation.dart';
import 'package:hive_tutorial/modules/view/Products_screen.dart';
import 'package:hive_tutorial/modules/view/notes_list.dart';
import 'package:hive_tutorial/services/notification_service.dart';
import 'package:hive_tutorial/widgets/card.dart';
import 'package:page_transition/page_transition.dart';
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

      _onTodoClicked() async {
      Navigator.of(context)
          .push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const NotesList();
            },
            transitionDuration: Duration(milliseconds: 1200),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                            curve: Curves.easeIn, parent: animation);
                        return Align(
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                            axisAlignment: 0.0,
                          ),
                        );
            },
            ),
            );
    }

    void _onWavesClicked(){
        Navigator.of(context)
          .push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return MusicVisulaizer();
            },
            // transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                            curve: Curves.easeInOutCirc, parent: animation);
                        return Align(
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                            axisAlignment: 0.0,
                          ),
                        );
            },
            ),
            );
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onProductClicked() {
      Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.bottomRight,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.leftToRightWithFade,
                      child: const ProductsScreen(),
                      childCurrent: widget),
                );
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
          const SizedBox(height: 32,),
          ItemCard(
            "Todo",
            _onTodoClicked,
          ),
          const SizedBox(
            height: 32,
          ),
          ItemCard(
            "Products",
            _onProductClicked,
          ),
           const SizedBox(
            height: 32,
          ),
          ItemCard(
            "Music Waves",
            _onWavesClicked ,
          ),
          
      TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end:controller.tagretValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return GestureDetector(
          onTap: () {
            controller.changeSize();
          },
          child: Image.asset("assets/images/vector.png",
          height: size,
          width: size,
          fit: BoxFit.cover,
          ),
        );
    
      },
      child: const Icon(Icons.aspect_ratio),
    ),

        ],
      )),
    );
  }
}
