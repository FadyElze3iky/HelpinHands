// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/username_update_button.dart';
import 'package:helping_hands/generated/l10n.dart';

class userNameField extends StatefulWidget {
  userNameField({super.key});

  @override
  State<userNameField> createState() => _userNameFieldState();
}

class _userNameFieldState extends State<userNameField> {
  static TextEditingController? controller;
  bool Isvisiable = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFieldCubit>(context).checkUserName();

    String name = BlocProvider.of<UserFieldCubit>(context).getUserName();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) async {
        if (state is UserNameHasData) {
          controller = TextEditingController(text: await state.username);
        } else if (state is UserNameIsNull) {
          controller = TextEditingController(text: '');
        }
      },
      builder: (context, state) {
        return textFormField(context, name);
      },
    );
  }

  Form textFormField(BuildContext context, String name) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 7.w),
        child: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.always,

          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
            suffixIcon: BlocConsumer<UserBottonCubit, UserBottonState>(
              listener: (context, state) {
                if (state is isvisiable) {
                  Isvisiable = state.check;
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: Isvisiable,
                  child: UserNameUpdateButton(formKey: formKey, name: name),
                );
              },
            ),
            label: Text(S.of(context).username),
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.circular(15.r)),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
          ),
          onChanged: (value) {
            BlocProvider.of<UserFieldCubit>(context).setUserName(value);

            if (value.isEmpty) {
              BlocProvider.of<UserBottonCubit>(context).setVisiable(false);
            } else if (!RegExp(r"^[a-zA-Z0-9_]+$").hasMatch(value)) {
              BlocProvider.of<UserBottonCubit>(context).setVisiable(false);
            } else {
              BlocProvider.of<UserBottonCubit>(context).setVisiable(true);
            }
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter username';
            } else if (!RegExp(r"^[a-zA-Z0-9_]+$").hasMatch(value)) {
              return "Username must contain only\n letters, numbers, and underscores";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
