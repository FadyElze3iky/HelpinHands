import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/radio_box.dart';

class ChoseLanguageBody extends StatelessWidget {
  ChoseLanguageBody({
    super.key,
    required this.isvisiable,
  });

  final bool isvisiable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
          visible: isvisiable,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 110.w),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.r,
                    color: Theme.of(context).colorScheme.shadow,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              height: 120.h,
              child: RadioBoxWidget(
                  currentLanguage: Localizations.localeOf(context).toString()),
            ),
          )),
    );
  }
}
