import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/address_field.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/nick_name_field.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/title_first_contain_info%20copy.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/username_field.dart';

// ignore: must_be_immutable
class FirstContainerInfo extends StatelessWidget {
  FirstContainerInfo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 6.r,
            offset: Offset(0, 2),
          ),
        ],
        color: Theme.of(context).colorScheme.scrim,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleOfContainerInfo(Title: 'Profile Information'),
          userNameField(),
          NickNameField(),
          AddressField(),
        ],
      ),
    );
  }
}
