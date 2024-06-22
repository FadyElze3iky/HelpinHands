import 'package:flutter/material.dart';

class animatingLogo extends StatelessWidget {
  const animatingLogo({
    super.key,
    required this.slideAnimation,
  });

  final Animation<Offset> slideAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: slideAnimation,
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.height * .2,
              child: Image(
                image: AssetImage('assets/images/HW.png'),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ));
      },
    );
  }
}
