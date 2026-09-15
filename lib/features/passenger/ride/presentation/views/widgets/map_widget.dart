import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
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
    return GoogleMapsWidget(
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
      markers: MapCubit.get(context).markers,
    );
  }
}
