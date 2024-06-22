import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/privacy_toggle.dart';
import 'package:helping_hands/generated/l10n.dart';

class PrivecyRow extends StatelessWidget {
  const PrivecyRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/user-lock (1).png',
          height: 25,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            S.of(context).Privacy,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        PrivacyToggle(),
      ],
    );
  }
}
