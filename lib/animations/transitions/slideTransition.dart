import 'package:flutter/material.dart';

class SlideTrans extends PageRouteBuilder {
  final Widget widget;
  SlideTrans({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;

              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}
