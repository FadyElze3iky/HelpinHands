import 'dart:developer';

import 'package:helping_hands/Features/Home/presentation/home.dart';
import 'package:helping_hands/Features/Splash/widgets/animatingLogo.dart';
import 'package:helping_hands/Features/Splash/widgets/animatingText.dart';
import 'package:helping_hands/Features/auth/presentation/LoginScreen.dart';
import 'package:helping_hands/core/utils/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation1;
  late Animation<Offset> slideAnimation2;
  late Animation<Offset> slideAnimation3;
  @override
  void initState() {
    super.initState();
    SlidingAnimation1();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 200.h,
        ),
        animatingLogo(slideAnimation: slideAnimation1),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        animatingText(slideAnimation: slideAnimation2),
        SizedBox(
          height: 200.h,
        ),
        // animatingButton(slideAnimation: slideAnimation3),
      ],
    );
  }

  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  void SlidingAnimation1() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    slideAnimation2 = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    slideAnimation1 =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    slideAnimation3 = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid = pref.getString('uid');
    if (uid == null) {
      Future.delayed(const Duration(milliseconds: 1100), () {
        fadeNavigator(context, LoginScreen());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1100), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }
}
