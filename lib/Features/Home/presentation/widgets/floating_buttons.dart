import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/floating_button.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/floating_serach_button.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingPostButton(),
        SizedBox(
          height: 5.h,
        ),
        FloatingSearchButton(),
      ],
    );
  }
}
