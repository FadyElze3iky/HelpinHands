import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/optoin_icon.dart';

class Options extends StatelessWidget {
  Options({
    super.key,
    required this.id,
  });
  String id;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.centerRight,
      child: OptionIcon(
        id: id,
      ),
    ));
  }
}
