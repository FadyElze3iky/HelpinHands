// ignore_for_file: must_be_immutable

part of 'user_field_cubit.dart';

@immutable
sealed class UserFieldState {}

final class ProfileInitial extends UserFieldState {}

class GetUserDataLoading extends UserFieldState {}

class GetUserDataSuccess extends UserFieldState {
  final data;
  GetUserDataSuccess({required this.data});
}

class GetUserDataFail extends UserFieldState {
  final error;
  GetUserDataFail({required this.error});
}

// 333333333333333333333Username333333333333333333333333333333333333
class updateLoging extends UserFieldState {}

class updatesuccess extends UserFieldState {}

class updateFailure extends UserFieldState {
  String error;
  updateFailure({required this.error});
}

class GetUserLoading extends UserFieldState {}

class GetUserSuccessfully extends UserFieldState {}

class GetUserFailure extends UserFieldState {
  String error;
  GetUserFailure(this.error);
}

class UserNameIsNull extends UserFieldState {}

class UserNameHasData extends UserFieldState {
  dynamic username;
  UserNameHasData({required this.username});
}

// 33333333333333333333333333333NickName33333333333333333333333333333333333333
class GetNickNameLoading extends UserFieldState {}

class GetNickNameSuccessfully extends UserFieldState {}

class GetNickNameFailure extends UserFieldState {
  String error;
  GetNickNameFailure(this.error);
}

class NickNameIsNull extends UserFieldState {}

class NickNameHasData extends UserFieldState {
  dynamic NickName;
  NickNameHasData({required this.NickName});
}

// 33333333333333333333333333333Address33333333333333333333333333333333333333

class GetAddressLoading extends UserFieldState {}

class GetAddressSuccessfully extends UserFieldState {}

class GetAddressFailure extends UserFieldState {
  String error;
  GetAddressFailure(this.error);
}

class AddressIsNull extends UserFieldState {}

class AddressHasData extends UserFieldState {
  dynamic address;
  AddressHasData({required this.address});
}

// 33333333333333333333333333333ChronicDiseases33333333333333333333333333333333333333

class GetChronicDiseasesLoading extends UserFieldState {}

class GetChronicDiseasesSuccessfully extends UserFieldState {}

class GetChronicDiseasesFailure extends UserFieldState {
  String error;
  GetChronicDiseasesFailure(this.error);
}

class ChronicDiseasesIsNull extends UserFieldState {}

class ChronicDiseasesHasData extends UserFieldState {
  dynamic ChronicDiseases;
  ChronicDiseasesHasData({required this.ChronicDiseases});
}

// 33333333333333333333333333333NationalID33333333333333333333333333333333333333

class GetNationalIDLoading extends UserFieldState {}

class GetNationalIDSuccessfully extends UserFieldState {}

class GetNationalIDFailure extends UserFieldState {
  String error;
  GetNationalIDFailure(this.error);
}

class NationalIDIsNull extends UserFieldState {}

class NationalIDHasData extends UserFieldState {
  dynamic NationalID;
  NationalIDHasData({required this.NationalID});
}

// 33333333333333333333333333333factorynum33333333333333333333333333333333333333

class GetFactoryNumLoading extends UserFieldState {}

class GetFactoryNumSuccessfully extends UserFieldState {}

class GetFactoryNumFailure extends UserFieldState {
  String error;
  GetFactoryNumFailure(this.error);
}

class FactoryNumIsNull extends UserFieldState {}

class FactoryNumHasData extends UserFieldState {
  dynamic FactoryNum;
  FactoryNumHasData({required this.FactoryNum});
}

// 33333333333333333333333333333BloodType33333333333333333333333333333333333333

class GetBloodTypeLoading extends UserFieldState {}

class GetBloodTypeSuccessfully extends UserFieldState {}

class GetBloodTypeFailure extends UserFieldState {
  String error;
  GetBloodTypeFailure(this.error);
}

class BloodTypeIsNull extends UserFieldState {}

class BloodTypeHasData extends UserFieldState {
  dynamic BloodType;
  BloodTypeHasData({required this.BloodType});
}
