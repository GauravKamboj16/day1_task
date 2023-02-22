import 'package:day1_task/modules/controller/MessagingController.dart';
import 'package:day1_task/modules/controller/ProductsController.dart';
import 'package:day1_task/modules/controller/SignupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'modules/view/Signup.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(
          providers:[
            ChangeNotifierProvider(create:(_)=>MessageController()),
            ChangeNotifierProvider(create:(_)=>ProductController()),
            ChangeNotifierProvider(create:(_)=>SignupController()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:   SignupScreen(),
           ),
        );
      }
    );
  }
}