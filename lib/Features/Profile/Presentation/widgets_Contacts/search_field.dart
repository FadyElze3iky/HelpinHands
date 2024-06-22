import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/search/search_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.background),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background)),
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.background,
            )),
        onChanged: (query) async {
          BlocProvider.of<SearchCubit>(context).search(context, query);
        },
      ),
    );
  }
}
