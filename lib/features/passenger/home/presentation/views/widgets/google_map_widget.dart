import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    super.key,
    required this.onMapCreated,
    required this.myLocation,
  });
  final Function(GoogleMapController googleMapController) onMapCreated;
  final LatLng myLocation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        var cubit = MapCubit.get(context);
        return GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          trafficEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: cubit.latS != null
                ? LatLng(cubit.latS!, cubit.lngS!)
                : myLocation,
            zoom: 15.0,
          ),
          circles: {
            Circle(
              circleId: const CircleId('value'),
              radius: 5,
              center: myLocation,
            )
          },
          polylines: cubit.lines,
          markers: cubit.markers.isNotEmpty
              ? cubit.markers
              : {
                  Marker(
                    markerId: const MarkerId('_currentLocation'),
                    position: myLocation,
                    icon: BitmapDescriptor.defaultMarkerWithHue(45),
                  )
                },
        );
      },
    );
  }
}
