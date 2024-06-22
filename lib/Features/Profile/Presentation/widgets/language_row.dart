import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/radio_box.dart';
import 'package:helping_hands/generated/l10n.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/language (1).png',
          height: 30,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            S.of(context).Language,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Localizations.localeOf(context).toString() == 'en'
                  ? Text(
                      'English',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    )
                  : Text(
                      'العربية',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
            ],
          ),
        ))
      ],
    );
  }
}
