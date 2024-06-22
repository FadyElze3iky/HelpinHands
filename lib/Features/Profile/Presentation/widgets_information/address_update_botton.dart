// ignore_for_file: use_build_context_synchronously

import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressUpdateButton extends StatelessWidget {
  const AddressUpdateButton({
    super.key,
    required this.formKey,
    required this.name,
  });

  final GlobalKey<FormState> formKey;
  final String name;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.update),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            dynamic response = await BlocProvider.of<UserFieldCubit>(context)
                .updateAddress(
                    BlocProvider.of<UserFieldCubit>(context).getAddress());

            BlocProvider.of<UserFieldCubit>(context).checkAddress();
            ShowToast(
                context: context,
                massage: response['message'],
                color: Colors.orange);
          }
          BlocProvider.of<UserBottonCubit>(context).Visiable(false);
        });
  }
}
