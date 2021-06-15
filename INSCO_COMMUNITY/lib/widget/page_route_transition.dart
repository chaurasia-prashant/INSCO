import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute({this.widget})
      : super(
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  curve: Curves.elasticInOut, parent: animation);
              return ScaleTransition(
                  alignment: Alignment.center, scale: animation, child: child);
            },
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
            ) {
              return widget;
            });
}
