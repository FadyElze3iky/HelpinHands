import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/add_user_contacts.dart';
import 'package:helping_hands/core/utils/api.dart';

// ignore: must_be_immutable
class SearchModel extends StatelessWidget {
  SearchModel({super.key, required this.model});
  Map<String, dynamic> model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AddUserContact(
          model: model,
        );
      })),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(
                model['PhotoURL'] == ''
                    ? 'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?t=st=1701551805~exp=1701552405~hmac=0c23b24dde3d757d32bf22ea065e29b73b577b7a952150cd1b89df4e8a7eb8a9'
                    : "${DataBaseApi.serverName}RestApi/${model['PhotoURL'].substring(3)}",
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model['username'] ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  model['NickName'] ?? '',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
