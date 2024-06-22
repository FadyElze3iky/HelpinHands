import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/profile_Contact.dart';
import 'package:helping_hands/generated/l10n.dart';

class EContactsRow extends StatelessWidget {
  const EContactsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileContact()));
      },
      child: Row(
        children: [
          Image.asset(
            'assets/icons/following (1).png',
            height: 25,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Text(
              S.of(context).EmergancyContacts,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
