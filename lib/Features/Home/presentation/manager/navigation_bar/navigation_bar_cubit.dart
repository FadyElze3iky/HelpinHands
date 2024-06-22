import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());

  int Index = 0;

  void ontap(int index) {
    Index = index;
    emit(selected(index: index));
  }

  int getindex() {
    if (Index == 1) {
      return 0;
    } else {
      return Index;
    }
  }
}
