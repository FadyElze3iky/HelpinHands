import 'package:flutter/material.dart';
import 'package:helping_hands/Features/PostReport/presentation/post_report.dart';

class FloatingPostButton extends StatelessWidget {
  const FloatingPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PostReport()));
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
