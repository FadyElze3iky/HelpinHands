import 'package:flutter/material.dart';

const Color kPrimaryColor1 = Color(0xff002333);
const Color kPrimaryColor2 = Color(0xffF2E3D5);
const String KmassagesCollection = 'massages';
const String Kmassage = 'massage';

// ignore: must_be_immutable
class ConcertOne extends StatelessWidget {
  ConcertOne(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});
  String text;
  double fontSize;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontFamily: 'ConcertOne', fontSize: fontSize, color: color),
    );
  }
}
