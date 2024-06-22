import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());

  void contacts() async {
    emit(WatingC());
    try {
      Future<List<Map<String, dynamic>>> list =
          profileImpl().getUserContactsDB();
      emit(await SuccessfflyC(list: list));
    } catch (e) {
      emit(FailedC(error: e.toString()));
    }
  }
}
