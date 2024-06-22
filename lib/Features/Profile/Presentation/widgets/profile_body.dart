// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/Logout.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/first_container.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/second_container.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets/upper_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          UpperSection(),
          FirstContainer(),
          SecondContainer(),
          Logout(),
        ],
      ),
    );
  }
}
