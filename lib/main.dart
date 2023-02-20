import 'package:day1_task/modules/controller/MessagingController.dart';
import 'package:day1_task/modules/view/listingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return ChangeNotifierProvider(
          create:  (context)=>MessageController(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:   ListingScreen(),
              ),
        );
      }
    );
  }
}
 