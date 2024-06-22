import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/generated/l10n.dart';

class ThemeRow extends StatelessWidget {
  const ThemeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/themes.png',
          height: 30,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            S.of(context).Theme,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
          child: GestureDetector(
            // onTap: () {
            //   BlocProvider.of<LanguageCubit>(context).changeTheme();
            // },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Theme.of(context).colorScheme.brightness.toString() ==
                        'Brightness.dark'
                    ? Text(
                        S.of(context).Dark,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      )
                    : Text(
                        S.of(context).light,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
