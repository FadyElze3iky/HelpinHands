import 'package:flutter/material.dart';

class TimeAgo extends StatelessWidget {
  TimeAgo({super.key, required this.dateTime});
  String dateTime;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          getTimeDifferenceFromTimestamp(dateTime),
          style: TextStyle(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.6)),
        ),
      ),
    );
  }

  String getTimeDifferenceFromTimestamp(String ApiTime) {
    DateTime apiDateTime = DateTime.parse(ApiTime);
    DateTime now = DateTime.now();
    int offsethours = DateTime.now().timeZoneOffset.inHours;
    DateTime localtime = apiDateTime.add(Duration(hours: offsethours));

    Duration difference = now.difference(localtime);

    if (difference.inDays > 0) {
      final days = difference.inDays;
      final hours = difference.inHours % 24;

      return "$days days, $hours hours ago";
    } else if (difference.inHours > 0) {
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      return "$hours hours, $minutes minutes ago";
    } else if (difference.inMinutes > 0) {
      final minutes = difference.inMinutes;
      return "$minutes minutes ago";
    } else {
      final seconds = difference.inSeconds;
      return "$seconds seconds ago";
    }
  }
}
