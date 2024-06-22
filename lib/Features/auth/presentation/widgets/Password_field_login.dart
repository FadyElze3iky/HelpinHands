// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:helping_hands/generated/l10n.dart";

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _passwordError;

  @override
  void dispose() {
    widget.passwordController.dispose();
    super.dispose();
  }

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

          return null;
        },
        decoration: InputDecoration(
            errorText: _passwordError,
            label: Text(S.of(context).Password),
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
