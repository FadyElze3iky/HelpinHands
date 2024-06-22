import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOnMap extends StatelessWidget {
  const LocationOnMap({
    super.key,
    required this.location,
    required CameraPosition initialCameraPosition,
  }) : _initialCameraPosition = initialCameraPosition;

  final List location;
  final CameraPosition _initialCameraPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.terrain,
          zoomControlsEnabled: false,
          trafficEnabled: true,
          markers: {
            Marker(
                markerId: MarkerId('value'),
                position: LatLng(location[0], location[1])),
          },
          initialCameraPosition: _initialCameraPosition),
    );
  }
}
