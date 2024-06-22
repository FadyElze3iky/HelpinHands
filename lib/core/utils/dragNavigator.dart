import 'package:flutter/material.dart';

void dragNavigator(BuildContext context, Widget) {
  Navigator.push(
      context,
      PageRouteBuilder(
        // send extra data
        // settings: RouteSettings(arguments: ),

        // recive extra data
        //  final name = ModalRoute.of(context).settings.arguments['name'];
        pageBuilder: (context, animation, secondaryAnimation) => Widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          );
        },
      ));
}
