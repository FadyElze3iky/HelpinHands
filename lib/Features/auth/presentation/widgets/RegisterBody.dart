import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Register_form.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/black_logo.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlackLogo(),
          SizedBox(
            height: 60.h,
          ),
          RegisterForm(),
        ],
      ),
    );
  }
}
