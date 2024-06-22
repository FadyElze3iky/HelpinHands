// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:helping_hands/generated/l10n.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({super.key, required this.onPress});
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            S.of(context).Register,
            style: TextStyle(
                fontSize: 17, color: Theme.of(context).colorScheme.background),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary),
          ),
        ));
  }
}
