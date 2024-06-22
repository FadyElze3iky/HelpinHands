// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlackLogo extends StatelessWidget {
  const BlackLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 330.h,
          child: Stack(children: [
            Positioned(
              child: Image(
                fit: BoxFit.contain,
                color: Theme.of(context).colorScheme.secondary,
                image: AssetImage('assets/images/blackTri.png'),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        child: Image(
                          color: Theme.of(context).colorScheme.secondary,
                          image: const AssetImage('assets/images/HelpingW.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
