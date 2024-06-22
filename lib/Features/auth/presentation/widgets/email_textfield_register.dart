// ignore_for_file: unused_element, prefer_const_declarations, unused_field

import 'package:flutter/material.dart';
import 'package:helping_hands/generated/l10n.dart';

class EmailTextFieldRegister extends StatefulWidget {
  EmailTextFieldRegister({
    required this.emailController,
    super.key,
  });
  final TextEditingController emailController;
  @override
  State<EmailTextFieldRegister> createState() => _EmailTextFieldRegisterState();
}

class _EmailTextFieldRegisterState extends State<EmailTextFieldRegister> {
  final _emailController = TextEditingController();
  String? _emailError;

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
        controller: widget.emailController,
        decoration: InputDecoration(
          errorText: _emailError,
          label: Text(S.of(context).Email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
