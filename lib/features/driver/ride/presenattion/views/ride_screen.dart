import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/driver_map_cubit/driver_map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/map_widget.dart';
import 'widgets/ride_details_container_widget.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key, required this.model});
  final RequestModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => DriverMapCubit()
                ..getLocation(
                  source: LatLng(model.latS, model.lngS),
                ),
              child: MapWidget(
                source: LatLng(model.latS, model.lngS),
                destination: LatLng(model.latD, model.lngD),
              ),
            ),
          ),
          RideDetailsContainerWidget(model: model)
        ],
      ),
    );
  }
}
