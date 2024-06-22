import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  String image;
  AuthButton({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        width: 350.w,
        child: InkWell(
          onTap: () {},
          child: GestureDetector(
            // onTap: () => BlocProvider.of<authCubit>(context).loginWithGoggle(),
            child: Image(
              image: Svg(
                image,
              ),
            ),
          ),
        ));
  }
}
