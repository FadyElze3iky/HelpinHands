import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/maps/data/map_imp.dart';
import 'package:helping_hands/Features/maps/presentation/manager/Searchdir/location_Cubit.dart';

class SerachResultModel extends StatelessWidget {
  const SerachResultModel({
    super.key,
    required this.places,
  });

  final Place places;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LocationCubit>(context).getMark(places);
        BlocProvider.of<LocationCubit>(context).setResultVisiable(false);
        BlocProvider.of<LocationCubit>(context).setController(places.name!);
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
            ),
            places.name!.length <= 30
                ? Text(
                    '  ' + places.name!,
                  )
                : Text('  ' + places.name!.substring(0, 30) + "..."),
          ],
        ),
      ),
    );
  }
}
