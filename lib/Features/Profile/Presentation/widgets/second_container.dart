import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/eContacts_row.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/security_row.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/theme_row.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContactsCubit>(context).contacts();

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
        margin: EdgeInsets.symmetric(horizontal: 14.w),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(.5),
              blurRadius: 6.r,
              offset: Offset(0, 2),
            ),
          ],
          color: Theme.of(context).colorScheme.scrim,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrivecyRow(),
            EContactsRow(),
            ThemeRow(),
          ],
        ),
      ),
    );
  }
}
