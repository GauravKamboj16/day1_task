/*
Developer- Gaurav Kamboj
Managing all Api requests Get/Post here in this class 

*/

import 'dart:convert';
import 'package:dio/dio.dart';
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

Future<dynamic> getData( ) {
  final url="https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

  Uri uri=Uri.parse(url);
  var dio = Dio();
  return dio.get(uri.toString()).then(
        (response) {
      if (response.statusCode! < 200 || response.statusCode! > 300) {
        throw Exception(response.data);
      }
      var decodedData=response.data;
      return decodedData;
    },
  ).catchError((e) {
    if (e is DioError) {
      return e.response;
    } else {
      // print(e.toString());
      throw Exception(e);
    }
  });
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