import 'package:helping_hands/Features/auth/presentation/manager/authCubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Forget_password_button.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Password_field_login.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/email_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/signIn_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    try {
      _emailController.dispose();
      _passwordController.dispose();
    } catch (e) {}
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform desired actions
      final email = _emailController.text;
      final password = _passwordController.text;
      await BlocProvider.of<authCubit>(context)
          .loginMethodDB(identifier: email, userPassword: password);
      // await BlocProvider.of<authCubit>(context)
      //     .loginMethod(userEmail: email, userPassword: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailTextField(emailController: _emailController),
          SizedBox(
            height: 15.h,
          ),
          PasswordTextField(
            passwordController: _passwordController,
          ),
          SizedBox(
            height: 5.h,
          ),
          ForgetPasswordButton(),
          SizedBox(
            height: 10.h,
          ),
          SignInButton(
            onPress: _submitForm,
          ),
        ],
      ),
    );
  }
}
