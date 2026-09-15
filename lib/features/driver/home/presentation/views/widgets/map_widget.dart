import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.myLocation});
  final LatLng myLocation;

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: widget.myLocation,
          zoom: 15.0,
        ),
        onMapCreated: onMapCreated,
        markers: {
          Marker(
            markerId: const MarkerId('myloaction'),
            position: widget.myLocation,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToMylocation,
        child: const Icon(Icons.location_on_outlined),
      ),
    );
  }

  Future<void> goToMylocation() async {
    await mapController.moveCamera(
      CameraUpdate.newLatLng(
        widget.myLocation,
      ),
    );
  }
}
