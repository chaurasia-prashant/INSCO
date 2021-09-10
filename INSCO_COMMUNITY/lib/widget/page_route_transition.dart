import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              // animation = CurvedAnimation(
              //     curve: Curves.linear , parent: animation);

              //   return ScaleTransition(
              //       alignment: Alignment.bottomCenter,
              //       scale: animation,
             //       child: child);

              return new FadeTransition(
                child: child,
                opacity: animation,

              );
            },
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
            ) {
              return widget;
            });
}
