import 'package:helping_hands/Features/auth/presentation/LoginScreen.dart';
import 'package:helping_hands/core/utils/dragNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class animatingButton extends StatelessWidget {
  const animatingButton({
    super.key,
    required this.slideAnimation,
  });

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: slideAnimation,
            child: GestureDetector(
              onTap: () {
                dragNavigator(context, LoginScreen());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                height: 60.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Shadow color
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset:
                          Offset(0, 6), // Changes the position of the shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12.w),
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
