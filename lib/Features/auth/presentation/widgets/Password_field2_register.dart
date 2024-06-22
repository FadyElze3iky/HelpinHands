// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:helping_hands/generated/l10n.dart";

class PasswordTextField2Resigter extends StatefulWidget {
  const PasswordTextField2Resigter(
      {super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField2Resigter> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).Pleaseenterapassword;
          }

          // Password validation criteria
          final minLength = 8;
          final mustContainPunctuation = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
          final mustContainCapitalLetter = RegExp(r'[A-Z]');
          final mustContainSmallLetter = RegExp(r'[a-z]');
          final mustContainNumber = RegExp(r'[0-9]');

          if (value.length < minLength) {
            return 'Password must be at least $minLength characters long.';
          }

          if (!mustContainPunctuation.hasMatch(value)) {
            return 'Password must contain at least one punctuation mark.';
          }

          if (!mustContainCapitalLetter.hasMatch(value)) {
            return 'Password must contain at least one capital letter.';
          }

          if (!mustContainSmallLetter.hasMatch(value)) {
            return 'Password must contain at least one small letter.';
          }

          if (!mustContainNumber.hasMatch(value)) {
            return 'Password must contain at least one number.';
          }

          ;
          return null;
        },
        decoration: InputDecoration(
            errorText: _passwordError,
            label: Text(S.of(context).PasswordAgain),
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: _togglePasswordVisibility,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        obscureText: _obscureText,
      ),
    );
  }
}
