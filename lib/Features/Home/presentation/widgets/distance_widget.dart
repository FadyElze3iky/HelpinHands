import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/accidant_location.dart';

class DistanceWidget extends StatelessWidget {
  DistanceWidget({
    super.key,
    required this.reportData,
  });
  Map<String, dynamic> reportData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AccidentLocation(reportData: reportData);
          },
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(114, 0, 0, 0),
                blurRadius: 7.r,
                offset: Offset(2, 4))
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      reportData['distance'].length > 4
                          ? '${reportData['distance'].substring(0, 4)} km'
                          : "${reportData['distance']} km",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      reportData['type'],
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Icon(
                    Icons.navigate_next_rounded,
                    size: 30.w,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
