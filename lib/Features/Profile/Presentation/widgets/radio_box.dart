import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/language_theme_cubit/language_cubit_cubit.dart';

// ignore: must_be_immutable
class RadioBoxWidget extends StatelessWidget {
  RadioBoxWidget({required this.currentLanguage});
  String? currentLanguage;
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    if (currentLanguage == 'en') {
      selectedOption = 'Option 1';
    } else {
      selectedOption = 'Option 2';
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioListTile<String>(
          fillColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.background),
          title: Text(
            'English',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
          value: 'Option 1',
          groupValue: selectedOption,
          onChanged: (value) {
            BlocProvider.of<LanguageCubit>(context).changeLanguage('en');
            Navigator.pop(context);
          },
        ),
        RadioListTile<String>(
          fillColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.background),
          title: Text(
            'العربية',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
          value: 'Option 2',
          groupValue: selectedOption,
          onChanged: (value) {
            BlocProvider.of<LanguageCubit>(context).changeLanguage('ar');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
