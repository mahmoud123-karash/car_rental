import 'package:car_rental/features/passenger/home/presentation/views/widgets/google_map_widget.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/map_controll_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapWidget extends StatefulWidget {
  const HomeMapWidget({super.key, required this.myLocation});
  final LatLng myLocation;

  @override
  State<HomeMapWidget> createState() => _HomeMapWidgetState();
}

class _HomeMapWidgetState extends State<HomeMapWidget> {
  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMapWidget(
          onMapCreated: onMapCreated,
          myLocation: widget.myLocation,
        ),
        Positioned(
          right: 20,
          top: 50,
          child: MapControllButtonWidget(
            onTap: () {
              mapController.moveCamera(
                CameraUpdate.newLatLng(
                  widget.myLocation,
                ),
              );
            },
            icon: Icons.my_location_sharp,
          ),
        ),
        Positioned(
          right: 20,
          bottom: 300,
          child: MapControllButtonWidget(
            onTap: () {
              mapController.moveCamera(CameraUpdate.zoomIn());
            },
            icon: Icons.add,
          ),
        ),
        Positioned(
          right: 20,
          bottom: 240,
          child: MapControllButtonWidget(
            onTap: () {
              mapController.moveCamera(CameraUpdate.zoomOut());
            },
            icon: Icons.remove,
          ),
        ),
      ],
    );
  }
}
