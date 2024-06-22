import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/findContact/presentation/contacts_location.dart';

class to_locations_list extends StatelessWidget {
  const to_locations_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (cotext) => ContactLocationList()));
          },
          icon: Image.asset(
            'assets/icons/search-location (1).png',
            height: 25,
            color: Theme.of(context).colorScheme.onBackground,
          )),
    );
  }
}
