import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/findContact/presentation/manager/contact_location/contact_location_cubit.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/contacts_list_view.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

// ignore: must_be_immutable
class locatoins_list_body extends StatelessWidget {
  locatoins_list_body({super.key});
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: BlocConsumer<ContactLocationCubit, ContactLocationState>(
        listener: (context, state) {
          if (state is GetListSuccessfully) {
            list = state.list;
          }
          if (state is GetListFailure) {
            ShowToast(
                context: context, massage: state.error, color: Colors.red);
          }
        },
        builder: (context, state) {
          if (state is ContactsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return list.isEmpty
              ? Center(
                  child: Text('no body share his location'),
                )
              : ContactsListView(list: list);
        },
      ),
    );
  }
}
