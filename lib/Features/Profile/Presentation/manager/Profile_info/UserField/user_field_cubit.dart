import 'package:bloc/bloc.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_field_state.dart';

class UserFieldCubit extends Cubit<UserFieldState> {
  UserFieldCubit() : super(ProfileInitial());
  // ###########################UserName########################################
  static String? userName;

  void userData() async {
    emit(GetUserDataLoading());
    try {
      String uid = await profileImpl().getUid();
      final data = await profileImpl().GetUserDataDB(uid);
      emit(GetUserDataSuccess(data: data));
    } catch (e) {
      emit(GetUserDataFail(error: e.toString()));
    }
  }

  void setUserName(String UserName) {
    userName = UserName;
  }

  String getUserName() {
    return userName ?? '';
  }

  Future<void> checkUserName() async {
    emit(GetUserLoading());
    try {
      String uid = await profileImpl().getUid();

      dynamic userDate = await profileImpl().GetUserDataDB(uid);
      if (userDate['username'] == null || userDate['username'] == '') {
        emit(UserNameIsNull());
      } else {
        setUserName(userDate['username']);
        emit(UserNameHasData(username: userDate['username']));
      }
    } catch (e) {
      emit(GetUserFailure(e.toString()));
    }
  }

  Future<dynamic> updateUserName(String username) async {
    emit(updateLoging());
    try {
      // Update the user's profile using the `updateProfile()` method of the `UserCredential` object.
      dynamic response = await profileImpl().updateUserNameDB(username);
      emit(updatesuccess());
      return response;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }

  // ##########################NickName####################################

  static String? nickName;

  void setNickName(String NickName) {
    nickName = NickName;
  }

  String getNickName() {
    return nickName ?? '';
  }

  Future<void> checkNickName() async {
    emit(GetNickNameLoading());
    try {
      String uid = await profileImpl().getUid();
      dynamic userDate = await profileImpl().GetUserDataDB(uid);

      if (userDate['NickName'] == null && userDate['NickName'] == '') {
        emit(NickNameIsNull());
      } else {
        emit(NickNameHasData(NickName: userDate['NickName']));
      }
      emit(GetNickNameSuccessfully());
    } catch (e) {
      emit(GetNickNameFailure(e.toString()));
    }
  }

  Future<dynamic> updateNickName(String nickName) async {
    emit(updateLoging());
    try {
      dynamic response = await profileImpl().updateNickNameDB(nickName);
      emit(updatesuccess());
      return response;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }

// 3333333333333333333Address33333333333333333333333333333333

  static String? address;

  void setAddress(String Address) {
    address = Address;
  }

  String getAddress() {
    return address ?? '';
  }

  Future<void> checkAddress() async {
    emit(GetAddressLoading());
    try {
      String uid = await profileImpl().getUid();

      dynamic userDate = await profileImpl().GetUserDataDB(uid);

      if (userDate['Address'] == null || userDate['Address'] == '') {
        emit(AddressIsNull());
      } else {
        setAddress(await userDate['Address']);
        emit(AddressHasData(address: await userDate['Address']));
      }
      emit(GetAddressSuccessfully());
    } catch (e) {
      emit(GetAddressFailure(e.toString()));
    }
  }

  Future<dynamic> updateAddress(String address) async {
    emit(updateLoging());
    try {
      // Update the user's profile using the `updateProfile()` method of the `UserCredential` object.
      dynamic response = await profileImpl().updateAddressDB(address);
      emit(updatesuccess());
      return response;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }

// 3333333333333333333333ChronicDiseases333333333333333333333333333333333

  static String? ChronicDiseases;

  void setChronicDiseases(String chronicDiseases) {
    ChronicDiseases = chronicDiseases;
  }

  String getChronicDiseases() {
    return ChronicDiseases ?? '';
  }

  Future<void> checkChronicDiseases() async {
    emit(GetChronicDiseasesLoading());
    try {
      String uid = await profileImpl().getUid();

      dynamic userDate = await profileImpl().GetUserDataDB(uid);

      if (userDate['ChronicDiseases'] == null ||
          userDate['ChronicDiseases'] == '') {
        emit(ChronicDiseasesIsNull());
      } else {
        setAddress(await userDate['ChronicDiseases']);
        emit(ChronicDiseasesHasData(
            ChronicDiseases: await userDate['ChronicDiseases']));
      }
      emit(GetChronicDiseasesSuccessfully());
    } catch (e) {
      emit(GetChronicDiseasesFailure(e.toString()));
    }
  }

  Future<dynamic> updateChronicDiseases(String ChronicDiseases) async {
    emit(updateLoging());
    try {
      dynamic response =
          await profileImpl().updateChronicDiseasesDB(ChronicDiseases);

      emit(updatesuccess());
      return response;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }

  // 3333333333333333333333NationalID333333333333333333333333333333333

  static String? NationalID;

  void setNationalID(String nationalID) {
    NationalID = nationalID;
  }

  String getNationalID() {
    return NationalID ?? '';
  }

  Future<void> checkNationalID() async {
    emit(GetNationalIDLoading());
    try {
      String uid = await profileImpl().getUid();

      dynamic userDate = await profileImpl().GetUserDataDB(uid);

      if (userDate['NationalID'] == null || userDate['NationalID'] == '') {
        emit(NationalIDIsNull());
      } else {
        setNationalID(await userDate['NationalID']);
        emit(NationalIDHasData(NationalID: await userDate['NationalID']));
      }
      emit(GetNationalIDSuccessfully());
    } catch (e) {
      emit(GetNationalIDFailure(e.toString()));
    }
  }

  Future<dynamic> updateNationalID(String NationalID) async {
    emit(updateLoging());
    try {
      dynamic responce = await profileImpl().updateNationalIdDB(NationalID);
      emit(updatesuccess());
      return responce;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }

  // 3333333333333333333333BloodType333333333333333333333333333333333

  static String? BloodType;

  void setBloodType(String bloodType) {
    BloodType = bloodType;
  }

  String getBloodTypem() {
    return BloodType ?? '';
  }

  Future<void> checkBloodType() async {
    emit(GetBloodTypeLoading());
    try {
      String uid = await profileImpl().getUid();

      dynamic userDate = await profileImpl().GetUserDataDB(uid);

      if (userDate['BloodType'] == null || userDate['BloodType'] == '') {
        emit(BloodTypeIsNull());
      } else {
        setBloodType(await userDate['BloodType']);
        emit(BloodTypeHasData(BloodType: await userDate['BloodType']));
      }
      emit(GetBloodTypeSuccessfully());
    } catch (e) {
      emit(GetBloodTypeFailure(e.toString()));
    }
  }

  Future<dynamic> updateBloodType(BloodType) async {
    emit(updateLoging());

    try {
      dynamic response = await profileImpl().updateBloodTypeDB(BloodType);
      emit(updatesuccess());
      return response;
    } catch (e) {
      emit(updateFailure(error: e.toString()));
    }
  }
}
