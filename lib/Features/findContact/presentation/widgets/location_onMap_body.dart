import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class location_onMap_Body extends StatelessWidget {
  location_onMap_Body({
    super.key,
    required this.latitude,
    required this.longitude,
  });
  double latitude;
  double longitude;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.terrain,
          zoomControlsEnabled: false,
          trafficEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: MarkerId('Circle'),
              position: LatLng(latitude, longitude),
            ),
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}
