import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/driver_map_cubit/driver_map_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/driver_map_cubit/driver_map_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.source,
    required this.destination,
  });
  final LatLng source, destination;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverMapCubit, DriverMapStates>(
      builder: (context, state) => GoogleMapsWidget(
        apiKey: apiKey,
        sourceLatLng: source,
        destinationLatLng: destination,
        routeWidth: 3,
        routeColor: appColor,
        sourceMarkerIconInfo: const MarkerIconInfo(
          assetMarkerSize: Size.fromHeight(500),
          icon: Icon(
            Icons.location_on,
            color: Colors.greenAccent,
            size: 500,
          ),
        ),
        markers: DriverMapCubit.get(context).markers,
      ),
    );
  }
}
