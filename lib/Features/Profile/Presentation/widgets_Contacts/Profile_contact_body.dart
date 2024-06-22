import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/Item_widget.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

// ignore: must_be_immutable
class ProfileContactBody extends StatelessWidget {
  ProfileContactBody({super.key});
  Future<List<Map<String, dynamic>>>? model_list;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactsCubit, ContactsState>(
      listener: (context, state) {
        if (state is SuccessfflyC) {
          model_list = state.list;
        }
        if (state is FailedC) {
          ShowToast(
              context: context,
              massage: state.error.toString(),
              color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is WatingC) {
          return CircularProgressIndicator();
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: FutureBuilder(
              future: model_list,
              builder: ((context, snapshot) {
                List<Map<String, dynamic>>? contacts = snapshot.data;
                if (contacts == null) {
                  return Container();
                }
                return GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    itemCount: contacts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        model: contacts[index],
                      );
                    });
              })),
        );
      },
    );
  }
}
