import 'dart:convert';
 
import 'package:day1_task/modules/view/ProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtil{

Future<dynamic> networkGet()async{

Uri url=Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
var response=await  http.get(url);
if(response.statusCode==200){
  return response;


}else{
  print("Status code !200");
  return null;
}

}

Future<dynamic> register(String  email, password,name,token,countryCode,phone,BuildContext context) async {
    Map data = {
      
      'email': email,
      'password': password,
      'name': name,
      'token': token,
      'countryCode':countryCode,
      'phone':phone


    };
    print(data);

    String body = json.encode(data);
    var url = Uri.parse('https://corract.onrender.com/user/signup');
    var response = await http.post(
      url,
      body: body,
    );

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
 
      return response;
       
    } else {
      return null;
    }
  }

}