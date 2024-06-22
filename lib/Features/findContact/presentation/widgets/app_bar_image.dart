import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/utils/api.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 41, 41, 41).withOpacity(0.2),
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
                    'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?t=st=1701551805~exp=1701552405~hmac=0c23b24dde3d757d32bf22ea065e29b73b577b7a952150cd1b89df4e8a7eb8a9')));
  }
}
