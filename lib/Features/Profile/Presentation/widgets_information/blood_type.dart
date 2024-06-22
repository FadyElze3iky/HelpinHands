import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/Profile_info/UserField/user_field_cubit.dart';
import 'package:helping_hands/generated/l10n.dart';

// ignore: must_be_immutable
class BloodTypeDropdown extends StatelessWidget {
  BloodTypeDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    String blood = S.of(context).Selectbloodtype;

    BlocProvider.of<UserFieldCubit>(context).checkBloodType();
    return BlocConsumer<UserFieldCubit, UserFieldState>(
      listener: (context, state) {
        if (state is BloodTypeHasData) {
          blood = state.BloodType;
          print('object');
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Localizations.localeOf(context).toString() == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.symmetric(vertical: 7.w, horizontal: 10.w),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15.r)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<BloodType>(
                borderRadius: BorderRadius.circular(20.r),
                hint: Text(blood),
                items: BloodType.values.map((bloodType) {
                  return DropdownMenuItem<BloodType>(
                    value: bloodType,
                    child: Text(bloodType.toString().split('.')[1]),
                  );
                }).toList(),
                onChanged: (selectedBloodType) async {
                  // Handle blood type selection
                  BlocProvider.of<UserFieldCubit>(context).updateBloodType(
                      selectedBloodType.toString().split('.')[1]);
                  BlocProvider.of<UserFieldCubit>(context).checkBloodType();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

enum BloodType {
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}
