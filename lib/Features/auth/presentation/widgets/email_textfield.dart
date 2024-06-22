// ignore_for_file: unused_element, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:helping_hands/generated/l10n.dart';

class EmailTextField extends StatefulWidget {
  EmailTextField({
    required this.emailController,
    super.key,
  });
  final TextEditingController emailController;
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).Pleaseenteranemailaddress;
          }

          return null;
        },
        controller: widget.emailController,
        decoration: InputDecoration(
          label: Text(S.of(context).EmailOrUsername),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ),
    );
  }
}
