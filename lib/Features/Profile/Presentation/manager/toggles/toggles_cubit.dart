import 'package:bloc/bloc.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';
import 'package:meta/meta.dart';

part 'toggles_state.dart';

class TogglesCubit extends Cubit<TogglesState> {
  TogglesCubit() : super(TogglesInitial());
  profileImpl profile = profileImpl();
  void setPrivacy(bool value) {
    emit(SetPrivacyLoading());
    try {
      profile.setPrivacy(value);
      emit(SetPrivacySuccess(value: value));
    } catch (e) {
      emit(SetPrivacyFailure(error: e.toString()));
    }
  }

  void getPrivacy() async {
    emit(GetPrivacyLoading());
    try {
      final value = await profile.getPrivacy();
      print(value);
      emit(GetPrivacySuccess(value: value));
    } catch (e) {
      emit(GetPrivacyFailure(error: e.toString()));
    }
  }
}
