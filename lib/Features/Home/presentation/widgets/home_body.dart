import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Home/presentation/manager/home_list/home_list_cubit.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/bar.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/home_list.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:helping_hands/generated/l10n.dart';

class HomeBody extends StatelessWidget {
  HomeBody({
    super.key,
  });
  List reports = [];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<HomeListCubit>(context).getReports();
        return Future.delayed(
            const Duration(seconds: 2)); // Simulate network call
      },
      child: BlocConsumer<HomeListCubit, HomeListState>(
        listener: (context, state) {
          if (state is GetDataSuccess) {
            reports = state.list;
          } else if (state is GetDataFailure) {
            ShowToast(
                context: context, massage: state.error, color: Colors.red);
          }
        },
        builder: (context, state) {
          if (state is GetDataLoading) {
            return CustomScrollView(
              slivers: [
                Bar(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return CustomScrollView(
              slivers: [
                Bar(),
                reports.isEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .4),
                        child: Center(
                            child: Text(S.of(context).NoReportsInYourErea)),
                      ))
                    : HomeList(
                        reports: reports,
                      ),
              ],
            );
          }
        },
      ),
    );
  }
}
