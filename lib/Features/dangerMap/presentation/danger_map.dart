import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/Features/dangerMap/data/danger_map_imp.dart';
import 'package:helping_hands/Features/dangerMap/presentation/manager/danger_map/danger_map_cubit.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:url_launcher/url_launcher.dart';

class DangerMap extends StatelessWidget {
  Set<Marker>? _markers;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30, 30), // San Francisco
    zoom: 4,
  );
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Danger Map'),
        actions: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<DangerMapCubit>(context).getMarkersTest();
            },
            child: Text(
              '  test  ',
              style: TextStyle(fontSize: 18),
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<DangerMapCubit>(context).getMarkersReal();
            },
            child: Text(
              '  real  ',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: BlocConsumer<DangerMapCubit, DangerMapState>(
        listener: (context, state) {
          if (state is GetMarkersSuccess) {
            _markers = state.markers;
          }
          if (state is GetMarkersFailure) {
            Fluttertoast.showToast(msg: state.error);
          }
          if (state is GetMarkersLoading) {
            Fluttertoast.showToast(msg: 'Loading...');
          }
        },
        builder: (context, state) {
          return GoogleMap(
            onLongPress: (argument) async {
              final url =
                  'https://www.google.com/maps/dir/?api=1&destination=${argument.latitude},${argument.longitude}';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                ShowToast(
                    context: context,
                    massage: 'Could not launch Google Maps',
                    color: Colors.red);
              }
            },
            myLocationEnabled: true,
            onMapCreated: (controller) {
              try {
                DangerMapImp().getCurrentLocation(controller);
                googleMapController = controller;
              } catch (e) {
                print(e.toString());
              }
            },
            initialCameraPosition: _initialCameraPosition,
            markers: _markers ?? {},
          );
        },
      ),
    );
  }
}
