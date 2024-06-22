import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/first_container_info.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_information/second_container_info.dart';

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FirstContainerInfo(),
          SecondContainerInfo(),
        ],
      ),
    );
  }
}
