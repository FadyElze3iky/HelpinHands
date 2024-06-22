// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/NationalId_update_botton.dart';
import 'package:helping_hands/generated/l10n.dart';

class NationalIDField extends StatefulWidget {
  NationalIDField({super.key});

  @override
  State<NationalIDField> createState() => _userNameFieldState();
}

class _userNameFieldState extends State<NationalIDField> {
  static TextEditingController? controller;
  bool Isvisiable = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFieldCubit>(context).checkNationalID();

    String NationalID =
        BlocProvider.of<UserFieldCubit>(context).getNationalID();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) async {
        if (state is NationalIDHasData) {
          controller = TextEditingController(text: await state.NationalID);
        } else if (state is NationalIDIsNull) {
          controller = TextEditingController(text: '');
        }
      },
      builder: (context, state) {
        return textFormField(context, NationalID);
      },
    );
  }

  Form textFormField(BuildContext context, String NationalID) {
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
                if (state is NationalIDvisiable) {
                  Isvisiable = state.check;
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: Isvisiable,
                  child: NationalIDUpdateButton(
                      formKey: formKey, name: NationalID),
                );
              },
            ),
            label: Text(S.of(context).NationalID),
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
            BlocProvider.of<UserFieldCubit>(context).setNationalID(value);

            if (value.isEmpty) {
              BlocProvider.of<UserBottonCubit>(context)
                  .nationalIDVisiable(false);
            } else if (value.length != 14 || int.tryParse(value) == null) {
              BlocProvider.of<UserBottonCubit>(context)
                  .nationalIDVisiable(false);
            } else {
              BlocProvider.of<UserBottonCubit>(context)
                  .nationalIDVisiable(true);
            }
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            } else if (value.length != 14 || int.tryParse(value) == null) {
              return "NationalID must be 14 number";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
