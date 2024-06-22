import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Home/presentation/manager/navigation_bar/navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Home/presentation/home_screen.dart';
import 'package:helping_hands/Features/Profile/Presentation/Profile.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:helping_hands/Features/chat/presentation/ChatPage.dart';
import 'package:helping_hands/Features/dangerMap/presentation/danger_map.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  profileImpl update = profileImpl();

  final pages = [
    HomeScreen(),
    DangerMap(),
    ChatPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    int index = BlocProvider.of<NavigationBarCubit>(context).getindex();

    return PopScope(
      canPop: false,
      child: BlocConsumer<NavigationBarCubit, NavigationBarState>(
        listener: (context, state) {
          if (state is selected) {
            index = state.index;
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: pages[index],
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Theme.of(context).colorScheme.background,
              onTap: (value) {
                BlocProvider.of<NavigationBarCubit>(context).ontap(value);
              },
              color: Theme.of(context).colorScheme.primary,
              buttonBackgroundColor: Theme.of(context).colorScheme.primary,
              animationCurve: Curves.easeInOut,
              height: 50.h,
              items: [
                Image.asset(
                  'assets/icons/home (1).png',
                  height: 20,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Image.asset(
                  'assets/icons/region-pin-alt (1).png',
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 20,
                ),
                Image.asset(
                  'assets/icons/comment (1).png',
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 20,
                ),
                Image.asset(
                  'assets/icons/user (1).png',
                  color: Theme.of(context).colorScheme.onPrimary,
                  height: 20,
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
          );
        },
      ),
    );
  }
}
