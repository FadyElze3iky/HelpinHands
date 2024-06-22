// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/ChronicDiseases_update_button.dart';
import 'package:helping_hands/generated/l10n.dart';

class ChronicDiseasesField extends StatefulWidget {
  ChronicDiseasesField({super.key});

  @override
  State<ChronicDiseasesField> createState() => _userNameFieldState();
}

class _userNameFieldState extends State<ChronicDiseasesField> {
  static TextEditingController? controller;
  bool Isvisiable = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFieldCubit>(context).checkChronicDiseases();

    String name = BlocProvider.of<UserFieldCubit>(context).getChronicDiseases();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) async {
        if (state is ChronicDiseasesHasData) {
          controller = TextEditingController(text: await state.ChronicDiseases);
        } else if (state is ChronicDiseasesIsNull) {
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
        height: 150.h,
        child: TextFormField(
          maxLines: null,
          controller: controller,
          autovalidateMode: AutovalidateMode.always,
          textAlignVertical: TextAlignVertical.top,
          expands: true,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
            suffixIcon: BlocConsumer<UserBottonCubit, UserBottonState>(
              listener: (context, state) {
                if (state is ChronicDiseasesvisiable) {
                  Isvisiable = state.check;
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: Isvisiable,
                  child:
                      ChronicDiseasesUpdateButton(formKey: formKey, name: name),
                );
              },
            ),
            label: Text(S.of(context).LetPeopleHelpYou),
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
            BlocProvider.of<UserFieldCubit>(context).setChronicDiseases(value);

            if (value.isEmpty) {
              BlocProvider.of<UserBottonCubit>(context)
                  .ChronicDiseasesVisiable(false);
            } else if (value.length < 10) {
              BlocProvider.of<UserBottonCubit>(context)
                  .ChronicDiseasesVisiable(false);
            } else {
              BlocProvider.of<UserBottonCubit>(context)
                  .ChronicDiseasesVisiable(true);
            }
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            } else if (value.length < 10) {
              return "Chronic Diseases must be more then ${value.length} chars";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
