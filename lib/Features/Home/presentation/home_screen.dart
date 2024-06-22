import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Home/presentation/manager/home_list/home_list_cubit.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/floating_buttons.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeListCubit>(context).getReports();

    return Scaffold(
      floatingActionButton: FloatingButtons(),
      body: HomeBody(),
    );
  }
}
