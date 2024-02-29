

import 'package:flutter/material.dart';

class AppThemeData{

  final int debugTime = 2;

  Color themeColor({String color = 'cyan'}){
    if(color == 'cyan'){
      return const Color(0xFFc0edfd);
    }
    else {
      //gray
      return const Color(0xFFeaf3fd);
    }
  }

}