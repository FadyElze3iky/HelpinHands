// ignore_for_file: unused_catch_clause

import 'package:helping_hands/Features/auth/data/authImp.dart';
import 'package:helping_hands/Features/auth/presentation/manager/authStates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authCubit extends Cubit<AuthState> {
  authCubit() : super(InitialState());

  Future<void> UserRegisterDB(
      {required String userEmail,
      required String userPassword,
      required String uesrName}) async {
    emit(WatingRegisterState());
    try {
      Map<String, dynamic> response =
          await AuthImp().signup(uesrName, userEmail, userPassword);
      try {
        if (response['status1'] && response['status2']) {
          emit(SuccessRegisterState());
        }
      } catch (e) {}
      try {
        if (response['status_username'] == false) {
          emit(FealureRegisterState(error: 'username already exist'));
        }
      } catch (e) {}
      try {
        if (response['status_email'] == false) {
          emit(FealureRegisterState(error: 'email already exist'));
        }
      } catch (e) {}
    } catch (e) {
      emit(FealureRegisterState(error: e.toString()));
    }
  }

  Future<void> loginMethodDB(
      {required String identifier, required String userPassword}) async {
    emit(WatingLoginState());
    try {
      Map<String, dynamic> response =
          await AuthImp().login(identifier, userPassword);
      if (response['loggedin']) {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('uid', response['uid']);
          emit(SuccessLoginStateDB(response: response['message']));
        } catch (e) {
          emit(FealureLoginState(e.toString()));
        }
      } else if (response['loggedin'] == false) {
        emit(FealureLoginState(response['message']));
      }
    } catch (e) {
      emit(FealureLoginState(e.toString()));
    }
  }
}
