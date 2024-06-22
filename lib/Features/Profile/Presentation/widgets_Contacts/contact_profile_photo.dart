import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/utils/api.dart';

class ContactProfilePhoto extends StatelessWidget {
  const ContactProfilePhoto({
    super.key,
    required this.model,
  });

  final Map<String, dynamic> model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: CircleAvatar(
            radius: 60.r,
            backgroundImage: NetworkImage(
              model['PhotoURL'] == ''
                  ? 'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?t=st=1701551805~exp=1701552405~hmac=0c23b24dde3d757d32bf22ea065e29b73b577b7a952150cd1b89df4e8a7eb8a9'
                  : "${DataBaseApi.serverName}RestApi/${model['PhotoURL'].substring(3)}",
            ),
          ),
        ),
      ],
    );
  }
}
