// ignore_for_file: unused_element, prefer_const_declarations, unused_field

import 'package:flutter/material.dart';
import 'package:helping_hands/generated/l10n.dart';

class UserNameFieldRegister extends StatefulWidget {
  UserNameFieldRegister({
    required this.usernameController,
    super.key,
  });
  final TextEditingController usernameController;
  @override
  State<UserNameFieldRegister> createState() => _EmailTextFieldRegisterState();
}

class _EmailTextFieldRegisterState extends State<UserNameFieldRegister> {
  final _usernameController = TextEditingController();
  String? _usernameError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).Pleaseenteranemailaddress;
          }

          // Regular expression to validate email format
          final usernameRegex = r'^[a-zA-Z0-9_]{3,20}$';

          if (!RegExp(usernameRegex, caseSensitive: false).hasMatch(value)) {
            return S.of(context).PleaseEnterValidUserName;
          }
          return null;
        },
        controller: widget.usernameController,
        decoration: InputDecoration(
          errorText: _usernameError,
          label: Text(S.of(context).username),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
