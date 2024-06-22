import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/to_locations_list.dart';
import 'package:helping_hands/Features/dangerMap/presentation/danger_map.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur values

      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Image.asset(
                    'assets/images/HW.png',
                    height: 35.h,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),

                Spacer(
                  flex: 1,
                ),

                // IconButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return DangerMap();
                //       }));
                //     },
                //     icon: Image.asset(
                //       'assets/icons/map-marker (1).png',
                //       height: 20,
                //       color: Theme.of(context).colorScheme.secondary,
                //     )),
                // to_locations_list(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
