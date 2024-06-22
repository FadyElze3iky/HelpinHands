import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helping_hands/Features/profile/presentation/widgets/profile_body.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: PopScope(
          onPopInvoked: (t) {
            SystemNavigator.pop();
          },
          canPop: false,
          child: ProfileBody()),
    );
  }
}
