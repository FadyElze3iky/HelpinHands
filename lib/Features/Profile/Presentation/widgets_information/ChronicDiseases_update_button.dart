// ignore_for_file: use_build_context_synchronously

import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserBotton/user_botton_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChronicDiseasesUpdateButton extends StatelessWidget {
  const ChronicDiseasesUpdateButton({
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
                .updateChronicDiseases(BlocProvider.of<UserFieldCubit>(context)
                    .getChronicDiseases());

            BlocProvider.of<UserFieldCubit>(context).checkChronicDiseases();
            ShowToast(
                context: context,
                massage: response['message'],
                color: Colors.orange);

            // Navigator.pop(context);
          }
          BlocProvider.of<UserBottonCubit>(context)
              .ChronicDiseasesVisiable(false);
        });
  }
}
