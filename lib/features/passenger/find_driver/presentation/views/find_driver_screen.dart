import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/find_driver/data/repo/driver_repo_impl.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/driver_cubit/driver_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_list_view_builder_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindDriverScreen extends StatelessWidget {
  const FindDriverScreen({
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
    return BlocProvider(
      create: (context) => DriverCubit(
        getIt.get<DriverRepoImpl>(),
      )..getDrivers(source: LatLng(latS, lngS)),
      child: Scaffold(
        body: Column(
          children: [
            DriverMapWidget(
              latS: latS,
              latD: latD,
              lngS: lngS,
              lngD: lngD,
            ),
            DriverListViewBuilderWidget(
              destination: LatLng(latD, lngD),
              source: LatLng(latS, lngS),
            ),
          ],
        ),
      ),
    );
  }
}
