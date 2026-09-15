import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/ride/data/repo/location_repo_impl.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/driver_builder_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/ride_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'source_to_destination_widget.dart';

class DriverAndRideInfoWidget extends StatelessWidget {
  const DriverAndRideInfoWidget(
      {super.key, required this.ride, required this.isArrived});
  final RideModel ride;
  final bool isArrived;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => MapCubit(
                  getIt.get<LocationRepoImpl>(),
                )..getLocation(
                    uid: ride.driverUid,
                    source: LatLng(ride.latS, ride.lngS),
                  ),
                child: DriverBuilderWidget(
                  driverUid: ride.driverUid,
                  rideUid: ride.rideUid,
                  source: LatLng(ride.latS, ride.lngS),
                ),
              ),
              const Spacer(),
              SourceToDestinationWidget(
                sAddress: ride.sAddress,
                dAddress: ride.dAddress,
              ),
              const Spacer(),
              RidePaymentWidget(
                  uid: ride.rideUid,
                  method: ride.paymentMethod,
                  isArrived: isArrived),
            ],
          ),
        ),
      ),
    );
  }
}
