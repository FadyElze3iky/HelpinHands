import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/profile_info_body.dart';
import 'package:helping_hands/generated/l10n.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          S.of(context).Editprofile,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      // ffff
      body: SingleChildScrollView(
        child: ProfileInfoBody(),
      ),
    );
  }
}
