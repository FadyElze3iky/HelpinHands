// ignore_for_file: unnecessary_null_comparison, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:helping_hands/generated/l10n.dart';

// ignore: must_be_immutable
class EmailFieldForForgetPassword extends StatefulWidget {
  EmailFieldForForgetPassword({super.key, required this.controller});
  TextEditingController controller;
  @override
  State<EmailFieldForForgetPassword> createState() =>
      _EmailFieldForForgetPasswordState();
}

class _EmailFieldForForgetPasswordState
    extends State<EmailFieldForForgetPassword> {
  dynamic chickValidation(String value) {
    // Regular expression to validate email format
    final emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$';

    if (value == null || value.isEmpty || value == '') {
      return false;
    } else if (!RegExp(emailRegex, caseSensitive: false).hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

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
          final emailRegex =
              r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$';

          if (!RegExp(emailRegex, caseSensitive: false).hasMatch(value)) {
            return S.of(context).Pleaseenteravalidemailaddress;
          }
          return null;
        },
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(S.of(context).Email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
