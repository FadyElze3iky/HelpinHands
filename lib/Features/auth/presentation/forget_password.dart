import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/draggableWidget.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassowrdCubit, ForgetPassowrdState>(
      listener: (context, state) {
        if (state is ChangeVisiablity) {}
      },
      builder: (context, state) {
        return Visibility(
          visible:
              BlocProvider.of<ForgetPassowrdCubit>(context).getvisiablity(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 20.r,
                  offset: Offset(3, 3),
                  spreadRadius: 4,
                )
              ],
            ),
            child: ForgetPasswordForm(),
          ),
        );
      },
    );
  }
}
