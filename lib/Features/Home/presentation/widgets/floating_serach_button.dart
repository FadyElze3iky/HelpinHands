import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/Search_users.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/search_field.dart';
import 'package:helping_hands/core/GeneralImp/accidant_detect.dart';

class FloatingSearchButton extends StatelessWidget {
  const FloatingSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.w, // Adjust as needed
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                content: Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SearchField(),
                      SearchUsers(),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Image.asset(
          'assets/icons/search (2).png',
          height: 15.h,
          color: Theme.of(context).colorScheme.onPrimary,
        ));
  }
}
