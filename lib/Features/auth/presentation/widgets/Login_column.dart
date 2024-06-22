import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Sign_in_form.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/black_logo.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/go_to_signUp.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to close forget password if it open
      onTap: () {
        if (BlocProvider.of<ForgetPassowrdCubit>(context).getvisiablity() ==
            true) {
          BlocProvider.of<ForgetPassowrdCubit>(context).changeVisiablity();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlackLogo(),
            SizedBox(
              height: 30.h,
            ),
            SignInForm(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            GoToSinUP(),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
