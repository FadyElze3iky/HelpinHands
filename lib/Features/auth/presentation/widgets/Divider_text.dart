import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/generated/l10n.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.h,
          width: 70.w,
          color: Colors.white,
        ),
        Text(S.of(context).OrContinueWith),
        Container(
          height: 1.h,
          width: 70.w,
          color: Colors.white,
        ),
      ],
    );
  }
}
