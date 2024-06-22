import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/utils/Location_last_update.dart';
import 'package:helping_hands/core/utils/api.dart';

// ignore: must_be_immutable
class ContactLocationModel extends StatelessWidget {
  ContactLocationModel({
    required this.item,
    super.key,
  });
  Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    String isActive = lastUpdate(item['date']);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 100.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 41, 41, 41).withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                  radius: 40.w,
                  backgroundImage: item['data'][0]['PhotoURL'] != ''
                      ? NetworkImage(
                          "${DataBaseApi.serverName}RestApi/${item['data'][0]['PhotoURL'].substring(3)}")
                      : NetworkImage(
                          'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?t=st=1701551805~exp=1701552405~hmac=0c23b24dde3d757d32bf22ea065e29b73b577b7a952150cd1b89df4e8a7eb8a9')),
            ),
          ),
          Text(
            " ${item['data'][0]['username']}  " ?? 'User',
            maxLines: 1,
            style: TextStyle(fontSize: 20.sp),
          ),
          isActive == 'Just Now'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ))
              : Container(),
          Spacer(
            flex: 1,
          ),
          Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
