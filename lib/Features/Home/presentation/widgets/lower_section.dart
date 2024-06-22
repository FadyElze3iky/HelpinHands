import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/utils/api.dart';

class LowerSection extends StatelessWidget {
  LowerSection({
    super.key,
    required this.distance,
    required this.reportData,
  });
  Map<String, dynamic> reportData;

  String distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .9,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(.65),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.h),
                  child: CircleAvatar(
                      radius: 35.r,
                      backgroundImage: NetworkImage(
                          '${DataBaseApi.serverName}/RestApi${reportData['profileImgUrl']}')),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      '  $distance  ',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      reportData['type'],
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
