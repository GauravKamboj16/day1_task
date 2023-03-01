/*
Developer- Gaurav Kamboj 
This service class manages every task related to Firebase notification
 *Asking for permision when android version>=13 and always in Ios

 initialising Notification Setting and setting icon for notification

 FirebaseInit() gives us a remoteMesaage we can extract title body from it and 
 Show Notification

 DeviceToken is required for firebase to send message to device

 Local notification plugin is required for showing notifications 



*/

import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  FirebaseMessaging messaging=FirebaseMessaging.instance;
  final flutterNotificationPlugin=FlutterLocalNotificationsPlugin();

  void requestNotificationPermission()async{

    NotificationSettings settings=await messaging.requestPermission(
      alert: true,
      announcement: true,
      sound: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true

    );


    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print("permission granted");
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
       print("provisional permission granted");
    }else{
      AppSettings.openNotificationSettings();
      print("Denied");
    }

  }
   

   void initNotification()async{

    var androidInitializationSettings=const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings=const DarwinInitializationSettings();

    var initializeSetting=InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    await flutterNotificationPlugin.initialize(
      initializeSetting,
    onDidReceiveNotificationResponse: ((payload) {
      
    }));

   }
   void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
    print(message.notification!.title.toString());
    print(message.notification!.body.toString());
    showNotification(message);

     });
   }

   Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationChannel channel=AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
       'High Importance Notification',
       importance: Importance.max
      );

      AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
         channel.id.toString(),
         channel.name.toString(),
         channelDescription: 'Channel Desc',
         importance: Importance.high,
         priority: Priority.high,
         ticker: 'ticker'
         );
       const DarwinNotificationDetails IOSNotificationDetails=DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true


       );  

       NotificationDetails nDetails=NotificationDetails(
        android: androidNotificationDetails,
        iOS: IOSNotificationDetails
       );

       Future.delayed(Duration.zero,(){
        flutterNotificationPlugin.show(
          1,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          nDetails);
       });


   }
   Future<String> getDeviceToken()async{
      String? token=await messaging.getToken();
      return token!;
    }

    void refreshToken(){
      messaging.onTokenRefresh.listen((event) {
        event.toString();
        print("Refreshed");
       });
    }
}