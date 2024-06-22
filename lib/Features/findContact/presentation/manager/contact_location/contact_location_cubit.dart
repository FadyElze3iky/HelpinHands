import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Features/findContact/data/find_contact_imp.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:meta/meta.dart';

part 'contact_location_state.dart';

class ContactLocationCubit extends Cubit<ContactLocationState> {
  ContactLocationCubit() : super(ContactLocationInitial());
  void contactsLocationList() async {
    emit(ContactsLoading());
    try {
      final list = await FindContactImp().getContactsLocation();

      emit(GetListSuccessfully(list));
    } catch (e) {
      emit(GetListFailure(e.toString()));
    }
  }

  Future<void> update_location(BuildContext context) async {
    try {
      bool success = await FindContactImp().startLocationUpdates();
      if (success) {
        ShowToast(
            context: context,
            massage: 'Your location updated',
            color: Colors.green);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteMyLocation(context) async {
    try {
      bool delete = await FindContactImp().deleteLocation();
      if (delete) {
        ShowToast(
            context: context,
            massage: 'your Location Deleted',
            color: Colors.green);
      } else {
        ShowToast(context: context, massage: 'try again', color: Colors.red);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
