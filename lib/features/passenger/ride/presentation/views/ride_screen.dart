import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/ride/data/data_sources/remote_data_source/manage_remote_data_source.dart';
import 'package:car_rental/features/passenger/ride/data/repo/location_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/data/repo/manage_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/manage_cubit.dart/manage_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/container_info_ride_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../manager/map_cubit/map_cubit.dart';
import 'widgets/map_builder_widget.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({
    super.key,
    required this.ride,
  });
  final RideModel ride;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => MapCubit(
                getIt.get<LocationRepoImpl>(),
              )..getLocation(
                  uid: ride.driverUid,
                  source: LatLng(ride.latS, ride.lngS),
                ),
              child: MapBuilderWidget(
                destination: LatLng(ride.latD, ride.lngD),
                source: LatLng(ride.latS, ride.lngS),
                uid: ride.driverUid,
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => ManageCubit(
                ManageRepoImpl(
                  ManageRemoteDataSourceImpl(),
                ),
              )..getData(uid: ride.rideUid),
              child: ContainerInfoRideBuilderWidget(
                ride: ride,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
