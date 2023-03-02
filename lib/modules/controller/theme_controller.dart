/*
Developer -Gaurav Kamboj
Provider class managing dark and light theme with Provider state Management
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier{
  var _themeMode=ThemeMode.light;

  IconData icon=Icons.wb_cloudy;
  double _tagretvalue=75.0;

  double get tagretValue=>_tagretvalue;

  void set setValue(double value){
    _tagretvalue=value;
  }


 void changeSize(){
   setValue = tagretValue == 75.0 ? 150.0 : 75.0;
   notifyListeners();
 }


  ThemeMode get themeMode=>_themeMode;

  void setTheme(ThemeMode themeMode){

    if(themeMode==ThemeMode.light){
      _themeMode=ThemeMode.dark;
      icon=Icons.wb_sunny;
    }else{
      _themeMode=ThemeMode.light;
      icon=Icons.wb_cloudy;

    }
    
    notifyListeners();

  }


}