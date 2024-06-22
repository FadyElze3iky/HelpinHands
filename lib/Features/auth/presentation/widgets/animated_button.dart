// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyAnimatedButton extends StatefulWidget {
  double hight;
  double width;
  ImageProvider imageProvider;
  VoidCallback voidCallback;
  MyAnimatedButton(
      {required this.imageProvider,
      required this.voidCallback,
      this.hight = 50,
      this.width = 50});
  @override
  _MyAnimatedButtonState createState() => _MyAnimatedButtonState(
      imageProvider: imageProvider, voidCallback: voidCallback);
}

class _MyAnimatedButtonState extends State<MyAnimatedButton> {
  bool _isTapped = false;
  VoidCallback voidCallback;
  ImageProvider imageProvider;
  _MyAnimatedButtonState(
      {required this.imageProvider, required this.voidCallback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });

        // BlocProvider.of<authCubit>(context).loginWithGoggle();
      },
      onTap: voidCallback,
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: SizedBox(
        width: widget.width,
        height: widget.hight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
              bottom: _isTapped ? 4.h : 0, top: _isTapped ? 2.h : 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), boxShadow: []),
          child: Image(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
