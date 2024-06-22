import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/auth/presentation/manager/authCubit.dart';
import 'package:helping_hands/Features/auth/presentation/manager/authStates.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/RegisterBody.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<authCubit, AuthState>(
      listener: (context, state) {
        if (state is WatingRegisterState) {
          isLoading = true;
        } else if (state is SuccessRegisterState) {
          isLoading = false;
          Navigator.pop(context);

          ShowToast(
              context: context,
              massage: 'Register Successfully',
              color: Colors.green);
        } else if (state is FealureRegisterState) {
          isLoading = false;
          ShowToast(context: context, massage: state.error, color: Colors.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: RegisterBody(),
          ),
        );
      },
    );
  }
}
