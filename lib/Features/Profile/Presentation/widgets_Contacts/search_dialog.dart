import 'package:flutter/material.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/Search_users.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/search_field.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      content: Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchField(),
              SearchUsers(),
            ],
          ),
        ),
      ),
    );
  }
}
