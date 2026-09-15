import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FavoriteMapWidget extends StatelessWidget {
  const FavoriteMapWidget({
    super.key,
    required this.name,
    required this.lat,
    required this.lng,
  });
  final String name;
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        trafficEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
          )
        },
      ),
    );
  }
}
