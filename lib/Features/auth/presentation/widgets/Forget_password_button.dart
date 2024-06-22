import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/generated/l10n.dart';

class ForgetPasswordButton extends StatelessWidget {
  ForgetPasswordButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ForgetPassowrdCubit>(context).changeVisiablity();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            S.of(context).ForgetPassword,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
