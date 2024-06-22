import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/nickname_update_botton.dart';
import 'package:helping_hands/generated/l10n.dart';

// ignore: must_be_immutable
class NickNameField extends StatefulWidget {
  NickNameField({super.key});
  @override
  State<NickNameField> createState() => _TextFieldModelState();
}

class _TextFieldModelState extends State<NickNameField> {
  TextEditingController controller = TextEditingController();
  bool Isvisiable = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserFieldCubit>(context).checkNickName();

    String name = BlocProvider.of<UserFieldCubit>(context).getNickName();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) async {
        if (state is NickNameHasData) {
          controller = TextEditingController(text: await state.NickName);
        } else if (state is NickNameIsNull) {
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
                if (state is ifvisiable) {
                  Isvisiable = state.check;
                }
              },
              builder: (context, state) {
                return Visibility(
                  visible: Isvisiable,
                  child: NickNameUpdateButton(formKey: formKey, name: name),
                );
              },
            ),
            label: Text(S.of(context).NickName),
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
            BlocProvider.of<UserFieldCubit>(context).setNickName(value);

            if (value.isEmpty) {
              BlocProvider.of<UserBottonCubit>(context).ifVisiable(false);
            } else {
              BlocProvider.of<UserBottonCubit>(context).ifVisiable(true);
            }
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
