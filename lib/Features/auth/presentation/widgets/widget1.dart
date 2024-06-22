import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/emailField_forgetpassword.dart';
import 'package:helping_hands/core/constants.dart';
import 'package:helping_hands/generated/l10n.dart';

class widget1 extends StatelessWidget {
  widget1({
    super.key,
    required this.emailController,
    required this.voidCallback,
  });
  final VoidCallback voidCallback;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                if (BlocProvider.of<ForgetPassowrdCubit>(context)
                        .getvisiablity() ==
                    true) {
                  BlocProvider.of<ForgetPassowrdCubit>(context)
                      .changeVisiablity();
                }
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        ConcertOne(
          text: S.of(context).WriteYourEmailHere,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
        SizedBox(height: 15.h),
        EmailFieldForForgetPassword(
          controller: emailController,
        ),
        SizedBox(height: 20.h),
        Container(
          child: ElevatedButton(
              onPressed: voidCallback, child: Icon(Icons.attach_email)),
        )
      ],
    ));
  }
}
