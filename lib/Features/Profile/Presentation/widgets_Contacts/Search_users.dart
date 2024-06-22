import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/search/search_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/search_model.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';

// ignore: must_be_immutable
class SearchUsers extends StatelessWidget {
  SearchUsers({
    super.key,
  });
  List<dynamic> model_list = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is Successffly) {
          model_list = state.list;
        }
        if (state is Failed) {
          ShowToast(
              context: context,
              massage: state.error.toString(),
              color: Colors.red);
        }
      },
      builder: (context, state) {
        if (model_list == []) {
          return Container();
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: model_list.length,
                itemBuilder: (context, index) {
                  return SearchModel(
                    model: model_list[index],
                  );
                }),
          );
        }
      },
    );
  }
}
