import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/findContact/presentation/manager/contact_location/contact_location_cubit.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/location_list_body.dart';
import 'package:helping_hands/generated/l10n.dart';

class ContactLocationList extends StatelessWidget {
  const ContactLocationList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContactLocationCubit>(context).contactsLocationList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(S.of(context).ContactsLocation),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () async {
              await BlocProvider.of<ContactLocationCubit>(context)
                  .deleteMyLocation(context);
            },
            icon: Image.asset(
              'assets/icons/location-dot-slash (1).png',
              color: Theme.of(context).colorScheme.onBackground,
              height: 25.w,
            ),
          ),
          IconButton(
            onPressed: () async {
              await BlocProvider.of<ContactLocationCubit>(context)
                  .update_location(context);
            },
            icon: Image.asset(
              'assets/icons/map-marker-check (1).png',
              color: Theme.of(context).colorScheme.onBackground,
              height: 25.w,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: locatoins_list_body()),
        ],
      ),
    );
  }
}
