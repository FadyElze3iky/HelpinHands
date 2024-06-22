import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(BuildContext context, String query) async {
    emit(Wating());
    try {
      final list = await profileImpl().searchUsersDB(query);
      emit(Successffly(list: list));
    } catch (e) {
      emit(Failed(error: e.toString()));
    }
  }
}
