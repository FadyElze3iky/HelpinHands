abstract class chatState {}

class InitialState extends chatState {}

class SentMassageLoading extends chatState {}

class SendMassageSuccessfullyState extends chatState {}

class SendMassageFealeureState extends chatState {
  String? error;
  SendMassageFealeureState({required this.error});
}

class GetMassageLoading extends chatState {}

class GetMassageSuccessfully extends chatState {
  List<String> chatList;

  GetMassageSuccessfully({
    required this.chatList,
  });
}

class GetMassageFealeure extends chatState {
  String? error;
  GetMassageFealeure({required this.error});
}
