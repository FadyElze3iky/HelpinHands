import 'package:flutter/material.dart';

class animatingText extends StatelessWidget {
  const animatingText({
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
          child: Text(
            'Helping Hands',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'ConcertOne',
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary),
          ),
        );
      },
    );
  }
}
