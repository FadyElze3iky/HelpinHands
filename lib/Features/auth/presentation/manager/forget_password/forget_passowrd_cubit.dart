import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:meta/meta.dart';

part 'forget_passowrd_state.dart';

class ForgetPassowrdCubit extends Cubit<ForgetPassowrdState> {
  ForgetPassowrdCubit() : super(ForgetPassowrdInitial());
  bool isvisiable = false;

  bool getvisiablity() {
    return isvisiable;
  }

  void changeVisiablity() {
    isvisiable = !isvisiable;
    emit(ChangeVisiablity(isVisible: isvisiable));
  }

  void resetPassowrd(BuildContext context, String email) async {
    try {
      ShowToast(
          context: context,
          massage: 'Chick your Email to reset your passowrd',
          color: Colors.green);

      changeVisiablity();
    } catch (e) {
      ShowToast(context: context, massage: e.toString(), color: Colors.red);
    }
  }
}
