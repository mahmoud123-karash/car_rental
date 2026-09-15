import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/driver_cubit/driver_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

import '../../manager/driver_cubit/driver_cubit.dart';

class DriverMapWidget extends StatelessWidget {
  const DriverMapWidget({
    super.key,
    required this.latS,
    required this.latD,
    required this.lngS,
    required this.lngD,
  });
  final double latS;
  final double latD;
  final double lngS;
  final double lngD;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverCubit, DriversStates>(
      builder: (context, state) => SizedBox(
        height: 350,
        child: GoogleMapsWidget(
          apiKey: apiKey,
          sourceLatLng: LatLng(latS, lngS),
          destinationLatLng: LatLng(latD, lngD),
          routeColor: appColor,
          markers: DriverCubit.get(context).markers,
          sourceMarkerIconInfo: const MarkerIconInfo(
            icon: Icon(
              Icons.location_on,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }
}
