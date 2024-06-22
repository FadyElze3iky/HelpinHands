import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/User_Contact_body.dart';
import 'package:helping_hands/Features/Profile/data/profileImpl.dart';

// ignore: must_be_immutable
class AddUserContact extends StatelessWidget {
  AddUserContact({super.key, required this.model});
  Map<String, dynamic> model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          model['username'],
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: model['Privacy'] != '1'
          ? FloatingActionButton(
              child: Icon(Icons.h_plus_mobiledata_sharp),
              onPressed: () {
                profileImpl().addContactDB(model['uid']);
                BlocProvider.of<ContactsCubit>(context).contacts();
                Navigator.pop(context);
              })
          : SizedBox(),
      body: UserContactBody(
        model: model,
      ),
    );
  }
}
