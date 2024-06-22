// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/images/scholar.png',
        fit: BoxFit.cover,
      ),
      width: 160,
      height: 160,
    );
  }
}
