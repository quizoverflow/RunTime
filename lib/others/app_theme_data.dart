

import 'package:flutter/material.dart';

class AppThemeData{
  //deubg timing
  int debugTime = 2;
  //title (가칭이므로 추후 변경)
  static const String appTitle = "Run Time";

  Color themeColor({String color = 'cyan'}){
    if(color == 'cyan'){
      return const Color(0xFFc0edfd);
    }
    else {
      //gray
      return const Color(0xFFeaf3fd);
    }
  }
  //page 전환
  PageRouteBuilder createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOutQuart;
        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return ScaleTransition(
          scale: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}