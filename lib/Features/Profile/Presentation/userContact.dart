import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/User_Contact_body.dart';
import 'package:helping_hands/generated/l10n.dart';

// ignore: must_be_immutable
class UserContact extends StatelessWidget {
  UserContact({super.key, required this.model});
  Map<String, dynamic> model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          model['username'] ?? '',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: model['Privacy'] == '0'
          ? UserContactBody(
              model: model,
            )
          : Center(
              child: Text(S.of(context).privacydata),
            ),
    );
  }
}
