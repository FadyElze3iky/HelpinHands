import 'package:flutter/material.dart';

void fadeNavigator(BuildContext context, Widget widget, {Object? arguments}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      // send extra data
      settings: RouteSettings(arguments: arguments),

      // recive extra data
      //  final name = ModalRoute.of(context).settings.arguments['name'];
      transitionDuration: Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
