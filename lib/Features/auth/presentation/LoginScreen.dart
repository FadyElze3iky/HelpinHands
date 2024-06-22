// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:helping_hands/Features/Home/presentation/home.dart';
import 'package:helping_hands/Features/auth/presentation/manager/authCubit.dart';
import 'package:helping_hands/Features/auth/presentation/manager/authStates.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Login_column.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/forgetPasswordColumn.dart';
import 'package:helping_hands/core/utils/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/widgets/ShowSnackBar.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (t) {
        SystemNavigator.pop();
      },
      canPop: true,
      child: BlocConsumer<authCubit, AuthState>(
          listener: (context, state) {
            if (state is WatingLoginState) {
              isloading = true;
            } else if (state is SuccessLoginStateDB) {
              isloading = false;

              fadeNavigator(context, Home());
              isloading = false;
            } else if (state is FealureLoginState) {
              isloading = false;

              ShowToast(
                  context: context, massage: state.error, color: Colors.red);

              isloading = false;
            }
          },
          builder: (context, state) => loginBody(context)),
    );
  }

  ModalProgressHUD loginBody(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            LoginColumn(),
            forgetPasswordColumn(),
          ]),
        ),
      ),
    );
  }
}
