import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/photo_view.dart';
import 'package:helping_hands/core/utils/api.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return image == ''
        ? Container()
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoViewer(
                          imageUrl:
                              '${DataBaseApi.serverName}/RestApi$image')));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: CachedNetworkImage(
                imageUrl: '${DataBaseApi.serverName}/RestApi$image',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * .8,
              ),
            ),
          );
  }
}
