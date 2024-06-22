import 'package:helping_hands/Features/auth/presentation/manager/authCubit.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Password_field1_register.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/Password_field2_register.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/email_textfield_register.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/auth/presentation/widgets/username_field.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:helping_hands/generated/l10n.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey2 = GlobalKey<FormState>();
  final _emailController2 = TextEditingController();
  final _userNameController2 = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _passwordController3 = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    try {
      _emailController2.dispose();
      _userNameController2.dispose();
      _passwordController2.dispose();
      _passwordController3.dispose();
    } catch (e) {}
  }

  void _submitForm() async {
    if (_passwordController2.text == _passwordController3.text) {
      if (_formKey2.currentState!.validate()) {
        // Form is valid, perform desired actions
        final email = _emailController2.text;
        final password = _passwordController2.text;
        final username = _userNameController2.text;
        await BlocProvider.of<authCubit>(context).UserRegisterDB(
          userEmail: email,
          userPassword: password,
          uesrName: username,
        );

        // await BlocProvider.of<authCubit>(context)
        //     .UserRegister(userEmail: email, userPassword: password);
      }
    } else {
      if (_formKey2.currentState!.validate()) {
        ShowToast(
            context: context,
            massage: S.of(context).Passwordsnotmatch,
            color: Colors.orange);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailTextFieldRegister(emailController: _emailController2),
          SizedBox(
            height: 15.h,
          ),
          UserNameFieldRegister(usernameController: _userNameController2),
          SizedBox(
            height: 15.h,
          ),
          PasswordTextField1Resigter(
            passwordController: _passwordController2,
          ),
          SizedBox(
            height: 15.h,
          ),
          PasswordTextField2Resigter(
            passwordController: _passwordController3,
          ),
          SizedBox(
            height: 20.h,
          ),
          RegisterButton(
            onPress: _submitForm,
          ),
        ],
      ),
    );
  }
}
