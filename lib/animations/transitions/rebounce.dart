import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class Rebond extends PageRouteBuilder {
  final Widget widget;
  Rebond({this.widget})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);

              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secanimation,
            ) {
              return widget;
            });
}
