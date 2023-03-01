import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier{
  var _themeMode=ThemeMode.light;

  IconData icon=Icons.wb_cloudy;



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