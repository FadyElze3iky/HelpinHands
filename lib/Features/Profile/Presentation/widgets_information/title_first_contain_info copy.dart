import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TitleOfContainerInfo extends StatelessWidget {
  TitleOfContainerInfo({super.key, required this.Title});
  String Title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      alignment: Localizations.localeOf(context).toString() == 'en'
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Text(
        Title,
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
