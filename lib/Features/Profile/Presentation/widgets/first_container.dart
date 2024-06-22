import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/edit_profile_information_row.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/language_row.dart';
import 'package:helping_hands/Features/dangerMap/presentation/danger_map.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EditProfileINformationRow(),
            SizedBox(
              height: 10.h,
            ),
            LanguageRow(),
          ],
        ),
      ),
    );
  }
}
