import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/distance_widget.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/post_image.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/time_ago.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/user_info_row.dart';

class ReportModel extends StatelessWidget {
  ReportModel({super.key, required this.reportData});
  Map<String, dynamic> reportData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15, top: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          UserInfoRow(
            profileImageUrl: reportData['profileImgUrl'],
            displayName: reportData['displayName'],
            uid: reportData['uid'],
            id: reportData['id'],
          ),
          PostImage(image: reportData['postImgUrl']),
          DistanceWidget(
            reportData: reportData,
          ),
          TimeAgo(
            dateTime: reportData['date'],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
