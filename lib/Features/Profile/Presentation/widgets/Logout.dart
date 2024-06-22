import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              prefs.remove('uid');
              Navigator.pushReplacementNamed(context, '/LoginPage');
            } catch (e) {
              ShowToast(
                  context: context, massage: e.toString(), color: Colors.red);
            }
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            margin: EdgeInsets.all(20.h),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
