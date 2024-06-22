import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helping_hands/Features/findContact/presentation/Location_on_map.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/contact_location_model.dart';

// ignore: must_be_immutable
class ContactsListView extends StatelessWidget {
  ContactsListView({required this.list});
  List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ContactLocationOnMap(location: list[index]);
                },
              ));
            },
            child: ContactLocationModel(item: list[index]));
      },
    );
  }
}
