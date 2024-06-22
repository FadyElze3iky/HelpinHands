import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/contact_profile_info.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/contact_profile_photo.dart';

// ignore: must_be_immutable
class UserContactBody extends StatelessWidget {
  UserContactBody({super.key, required this.model});
  Map<String, dynamic> model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactProfilePhoto(model: model),
          ContactProfileInfo(model: model)
        ],
      ),
    );
  }
}
