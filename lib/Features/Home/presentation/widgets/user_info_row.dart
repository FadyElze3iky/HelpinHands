import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/options.dart';
import 'package:helping_hands/Features/Profile/Presentation/userContact.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';

class UserInfoRow extends StatelessWidget {
  UserInfoRow(
      {super.key,
      required this.profileImageUrl,
      required this.displayName,
      required this.uid,
      required this.id});
  String profileImageUrl;
  String id;
  String displayName;
  String uid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final model = await profileImpl().GetUserDataDB(uid);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => UserContact(model: model)));
      },
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: profileImageUrl == ''
                  ? Icon(
                      Icons.person,
                      size: 50.w,
                    )
                  : Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(114, 0, 0, 0),
                            blurRadius: 13.r,
                            offset: Offset(2, 3))
                      ], shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: NetworkImage(
                            '${DataBaseApi.serverName}/RestApi$profileImageUrl'),
                      ),
                    ),
            ),
          ),
          displayName == ''
              ? Text('User')
              : Text(
                  displayName,
                  style: TextStyle(fontSize: 16.sp),
                ),
          Options(id: id),
        ],
      ),
    );
  }
}
