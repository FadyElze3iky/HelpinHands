import 'package:flutter/material.dart';
import 'package:helping_hands/Features/auth/presentation/forget_password.dart';

class forgetPasswordColumn extends StatelessWidget {
  const forgetPasswordColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ForgetPassword(),
      ],
    );
  }
}
