import 'package:flutter/material.dart';
import 'package:helping_hands/Features/auth/presentation/RegisterScreen.dart';
import 'package:helping_hands/core/utils/Navigator.dart';
import 'package:helping_hands/generated/l10n.dart';

class GoToSinUP extends StatelessWidget {
  const GoToSinUP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).DontHaveAnAccount),
        GestureDetector(
          onTap: () {
            fadeNavigator(context, RegisterScreen());
            // go to sign up page
          },
          child: Text(
            S.of(context).RegisterNow,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                decorationThickness: 2),
          ),
        ),
      ],
    );
  }
}
