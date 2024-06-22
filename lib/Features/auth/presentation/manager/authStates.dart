abstract class AuthState {}

class InitialState extends AuthState {}

class WatingLoginState extends AuthState {}

class SuccessLoginStateDB extends AuthState {
  String response;
  SuccessLoginStateDB({required this.response});
}

class FealureLoginState extends AuthState {
  String error;
  FealureLoginState(this.error);
}

class WatingRegisterState extends AuthState {}

class SuccessRegisterState extends AuthState {}

class FealureRegisterState extends AuthState {
  String error;
  FealureRegisterState({required this.error});
}
