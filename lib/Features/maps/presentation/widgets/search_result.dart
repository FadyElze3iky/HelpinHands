import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/maps/data/map_imp.dart';
import 'package:helping_hands/Features/maps/presentation/widgets/search_result_model.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.visiablity,
    required this.places,
  });

  final bool visiablity;
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visiablity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(13.h),
        width: MediaQuery.of(context).size.width,
        height: 260.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return SerachResultModel(places: places[index]);
          },
        ),
      ),
    );
  }
}
