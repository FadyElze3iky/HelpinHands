import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/Features/Home/presentation/manager/acc_on_map/acc_on_map_cubit.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/location_on_map.dart';
import 'package:helping_hands/Features/Home/presentation/widgets/lower_section.dart';

class AccidentLocation extends StatelessWidget {
  AccidentLocation({
    super.key,
    required this.reportData,
  });

  Map<String, dynamic> reportData;

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<AccOnMapCubit>(context);
    provider.streem?.resume();
    provider.GetDistance([
      double.parse(reportData['locationLat']),
      double.parse(reportData['locationLong'])
    ]);
    List location = [
      double.parse(reportData['locationLat']),
      double.parse(reportData['locationLong'])
    ];
    String distance = reportData['distance'];

    final _initialCameraPosition = CameraPosition(
      target: LatLng(double.parse(reportData['locationLat']),
          double.parse(reportData['locationLong'])), // San Francisco
      zoom: 15,
    );
    return PopScope(
      onPopInvoked: (didPop) {
        provider.streem?.pause();
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: LocationOnMap(
                    location: location,
                    initialCameraPosition: _initialCameraPosition),
              ),
              BlocConsumer<AccOnMapCubit, AccOnMapState>(
                listener: (context, state) {
                  if (state is AccOnMapSuccess) {
                    distance = state.distance;
                  }
                },
                builder: (context, state) {
                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LowerSection(
                      distance: distance,
                      reportData: reportData,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
