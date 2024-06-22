import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helping_hands/Features/maps/data/map_imp.dart';
import 'package:helping_hands/Features/maps/presentation/manager/Searchdir/location_Cubit.dart';
import 'package:helping_hands/Features/maps/presentation/widgets/map_search_field.dart';
import 'package:helping_hands/Features/maps/presentation/widgets/search_result.dart';
import 'package:helping_hands/core/widgets/ShowSnackBar.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  List<Place> places = [];
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30, 30), // San Francisco
    zoom: 6,
  );
  bool visiablity = false;
  List<Marker> _markers = [];

  TextEditingController controller = TextEditingController();

  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is getMarkesSuccess) {
              _markers = state.marker;
            }
            if (state is getMarkeSuccess) {
              _markers = [];
              _markers.add(state.marker);
            }
            if (state is setTextController) {
              controller = state.controller;
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                GoogleMap(
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
                  trafficEnabled: true,
                  onMapCreated: (controller) {
                    try {
                      MapImp().getCurrentLocation(controller);
                      googleMapController = controller;
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  initialCameraPosition: _initialCameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  markers: _markers.toSet(),
                ),
                Column(
                  children: [
                    MapSearchField(
                      controller: controller,
                    ),
                    BlocConsumer<LocationCubit, LocationState>(
                      listener: (context, state) {
                        if (state is VisiableChange) {
                          visiablity = state.visiable;
                        }
                        if (state is getPlaceSuccess) {
                          places = state.place;
                        }
                      },
                      builder: (context, state) {
                        return SearchResults(
                            visiablity: visiablity, places: places);
                      },
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () async {
                      Position position = await Geolocator
                          .getCurrentPosition(); // Or use your preferred location API
                      if (googleMapController != null) {
                        try {
                          googleMapController!.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                    position.latitude, position.longitude),
                                zoom: 17, // Adjust zoom level as needed
                              ),
                            ),
                          );
                        } catch (e) {
                          ShowToast(
                              context: context,
                              massage: e.toString(),
                              color: Colors.red);
                        }
                      }
                    },
                    child: Transform.rotate(
                      angle: -.8,
                      child: Container(
                        margin: EdgeInsets.all(10.w),
                        width: 60.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.background),
                        child: Image.asset(
                          'assets/icons/locationIcon.png',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
