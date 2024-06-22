import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/live_location_bar.dart';
import 'package:helping_hands/Features/findContact/presentation/widgets/location_onMap_body.dart';

class ContactLocationOnMap extends StatelessWidget {
  ContactLocationOnMap({
    required this.location,
    super.key,
  });
  Map<String, dynamic> location;
  @override
  Widget build(BuildContext context) {
    double latitude = double.parse(location['locationLat']);
    double longitude = double.parse(location['locationLong']);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            location_onMap_Body(latitude: latitude, longitude: longitude),
            CostomBarLiveLocation(
              data: location,
            ),
          ],
        ),
      ),
    );
  }
}
