import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/core/utils/api.dart';

class AvatarImage extends StatelessWidget {
  AvatarImage({super.key, required this.model});
  dynamic model;
  @override
  Widget build(BuildContext context) {
    String img =
        'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671116.jpg?w=740&t=st=1711129811~exp=1711130411~hmac=57a909710bb343635eb0aec65b705e60e04508dc6f02489a7726007902d3ee81';
    try {
      img =
          "${DataBaseApi.serverName}RestApi/${model['PhotoURL'].substring(3)}";
    } catch (e) {}
    return Stack(children: [
      Container(
        width: 150.w,
        height: 150.w,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.background, width: 7.w),
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(80.r),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(img),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.background, width: 5.w),
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(80.r),
          ),
          child: IconButton(
            onPressed: () async {
              profileImpl().uploadImage();
            },
            icon: Icon(Icons.mode_edit_outlined),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    ]);
  }
}
