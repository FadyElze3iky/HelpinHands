import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/profile_information.dart';
import 'package:helping_hands/generated/l10n.dart';

// ignore: must_be_immutable
class EditProfileINformationRow extends StatelessWidget {
  EditProfileINformationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileInfo()));
      },
      child: Row(
        children: [
          Image.asset(
            'assets/icons/edit (1).png',
            height: 25,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              S.of(context).EditProfileInformation,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
