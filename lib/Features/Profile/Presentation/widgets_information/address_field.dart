// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/address_update_botton.dart';
import 'package:helping_hands/generated/l10n.dart';

class AddressField extends StatefulWidget {
  AddressField({super.key});

  @override
  State<AddressField> createState() => _userNameFieldState();
}

class _userNameFieldState extends State<AddressField> {
  static TextEditingController? controller;
  bool Isvisiable = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFieldCubit>(context).checkAddress();

    String address = BlocProvider.of<UserFieldCubit>(context).getAddress();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) async {
        if (state is AddressHasData) {
          controller = TextEditingController(text: await state.address);
        } else if (state is AddressIsNull) {
          controller = TextEditingController(text: '');
        }
      },
      builder: (context, state) {
        return textFormField(context, address);
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
                if (state is visiable) {
                  Isvisiable = state.check;
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: Isvisiable,
                  child: AddressUpdateButton(formKey: formKey, name: name),
                );
              },
            ),
            label: Text(S.of(context).Address),
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
            BlocProvider.of<UserFieldCubit>(context).setAddress(value);

            if (value.isEmpty) {
              BlocProvider.of<UserBottonCubit>(context).Visiable(false);
            } else if (value.length < 10) {
              BlocProvider.of<UserBottonCubit>(context).Visiable(false);
            } else {
              BlocProvider.of<UserBottonCubit>(context).Visiable(true);
            }
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            } else if (value.length < 10) {
              return "address must be more then ${value.length} chars";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
