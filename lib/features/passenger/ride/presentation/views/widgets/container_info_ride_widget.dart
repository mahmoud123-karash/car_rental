import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';
import 'package:car_rental/features/passenger/ride/domain/use_cases/time_use_case.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/time_cubit/time_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/arrive_time_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'driver_and_ride_info_widget.dart';

class ContainerInfoRideWidget extends StatelessWidget {
  const ContainerInfoRideWidget(
      {super.key, required this.ride, required this.model});
  final RideModel ride;
  final ManageModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => TimeCubit(
                getIt.get<TimeUseCase>(),
              )..getTime(
                  uid: ride.driverUid,
                  source: LatLng(ride.latS, ride.lngS),
                ),
              child: ArriveTimeBuilderWidget(
                uid: ride.driverUid,
                source: LatLng(ride.latS, ride.lngS),
                isArrived: model.isArrived,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            DriverAndRideInfoWidget(ride: ride, isArrived: model.isArrived),
          ],
        ),
      ),
    );
  }
}
