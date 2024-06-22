import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_botton_state.dart';

class UserBottonCubit extends Cubit<UserBottonState> {
  UserBottonCubit() : super(UserInitial());
// username
  void setVisiable(bool x) {
    emit(isvisiable(check: x));
  }

  // nickname

  void ifVisiable(bool x) {
    emit(ifvisiable(check: x));
  }

// address

  void Visiable(bool x) {
    emit(visiable(check: x));
  }

// address

  void ChronicDiseasesVisiable(bool x) {
    emit(ChronicDiseasesvisiable(check: x));
  }

// national ID

  void nationalIDVisiable(bool x) {
    emit(NationalIDvisiable(check: x));
  }

//FactoryNum

  void FactoryNumVisiable(bool x) {
    emit(FactoryNumvisiable(check: x));
  }
}
