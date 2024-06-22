import 'package:intl/intl.dart';

String lastUpdate(String date) {
  DateTime givenTime = DateTime.parse(date);
  int offsethours = DateTime.now().timeZoneOffset.inHours;

  DateTime contactDate = DateTime.parse(date);
  DateTime localtime = contactDate.add(Duration(hours: offsethours));
  if (DateTime.now().difference(localtime).inMinutes < 1) {
    return 'Just Now';
  } else {
    return DateFormat('yy-MM-dd HH:mm').format(localtime).toString();
  }
}
