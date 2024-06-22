import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/core/utils/Location_last_update.dart';
import 'package:helping_hands/generated/l10n.dart';

class AppBarData extends StatelessWidget {
  const AppBarData({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String time = lastUpdate(data['date']);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['data'][0]['NickName'],
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
        Row(
          children: [
            Text(
              '${S.of(context).LastUpdate}: $time',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ],
        )
      ],
    );
  }
}
