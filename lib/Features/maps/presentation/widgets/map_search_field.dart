import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/maps/presentation/manager/Searchdir/location_Cubit.dart';

class MapSearchField extends StatelessWidget {
  MapSearchField({
    required this.controller,
    super.key,
  });

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.w),
      height: 55.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            hintText: 'Search here',
            suffixIcon: Icon(Icons.search),
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.r)))),
        onChanged: (value) async {
          BlocProvider.of<LocationCubit>(context).getPlaces(value);
          if (value.isEmpty) {
            BlocProvider.of<LocationCubit>(context).setResultVisiable(false);
          } else {
            BlocProvider.of<LocationCubit>(context).setResultVisiable(true);
          }
        },
        onSubmitted: (value) {
          BlocProvider.of<LocationCubit>(context).getMarkes(value);
          BlocProvider.of<LocationCubit>(context).setResultVisiable(false);
        },
      ),
    );
  }
}
