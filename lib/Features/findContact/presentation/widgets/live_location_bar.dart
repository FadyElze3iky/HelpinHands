import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/app_bar_data.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/app_bar_image.dart';

class CostomBarLiveLocation extends StatelessWidget {
  CostomBarLiveLocation({super.key, required this.data});
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.h),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(.65),
                borderRadius: BorderRadius.circular(30.r)),
            height: 130.h,
            width: MediaQuery.of(context).size.width * .9,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarImage(item: data),
                  SizedBox(
                    width: 20.w,
                  ),
                  AppBarData(data: data),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
