import 'package:bloc/bloc.dart';
import 'package:helping_hands/Features/Home/data/home_impl.dart';
import 'package:meta/meta.dart';

part 'home_list_state.dart';

class HomeListCubit extends Cubit<HomeListState> {
  HomeListCubit() : super(HomeListInitial());
  final HomeImpl homeImpl = HomeImpl();

  Future<void> getReports() async {
    emit(GetDataLoading());
    try {
      List Reports = await homeImpl.fetchNearbyReports();
      emit(GetDataSuccess(list: Reports));
    } catch (e) {
      emit(GetDataFailure(error: e.toString()));
    }
  }
}
