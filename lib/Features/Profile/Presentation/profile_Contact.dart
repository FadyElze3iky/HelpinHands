import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helping_hands/Features/Profile/Presentation/manager/emaergancy_contacts/contacts/contacts_cubit.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/Profile_contact_body.dart';
import 'package:helping_hands/Features/Profile/Presentation/widgets_Contacts/floating_botton.dart';
import 'package:helping_hands/generated/l10n.dart';

class ProfileContact extends StatelessWidget {
  const ProfileContact({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContactsCubit>(context).contacts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          S.of(context).EmergancyContacts,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingButton(),
      body: SingleChildScrollView(
        child: ProfileContactBody(),
      ),
    );
  }
}
