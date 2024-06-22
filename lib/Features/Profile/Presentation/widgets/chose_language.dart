import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/chose_language_body.dart';

// ignore: must_be_immutable
class ChoseLanguage extends StatelessWidget {
  ChoseLanguage({
    super.key,
  });
  bool isvisiable = false;
  @override
  Widget build(BuildContext context) {
    return ChoseLanguageBody(isvisiable: isvisiable);
  }
}
