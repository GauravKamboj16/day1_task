import 'package:day1_task/modules/view/ProductsScreen.dart';
import 'package:day1_task/services/NetworkUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier{

 var isLoading=false;
 NetworkUtil network=NetworkUtil();


 Future<dynamic> resisterUser(email, password, name, token, countryCode, phone, context)async{
 var res= await network.register(email, password, name, token, countryCode, phone, context);

 if(res!=null){
  print("The response is ${res.body}");
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return ProductsScreen();
  }));

 }else{
  print("Null response");
 }



 }




}