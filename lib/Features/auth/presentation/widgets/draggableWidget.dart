import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/auth/presentation/manager/forget_password/forget_passowrd_cubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/widget1.dart';

class ForgetPasswordForm extends StatefulWidget {
  ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform desired actions
      final email = _emailController.text;
      BlocProvider.of<ForgetPassowrdCubit>(context)
          .resetPassowrd(context, email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget1(
        emailController: _emailController,
        voidCallback: _submitForm,
      ),
    );
  }
}
