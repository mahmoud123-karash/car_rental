import 'dart:async';

import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_states.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/request_driver_button_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/ride_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomButtonBuilderWidget extends StatefulWidget {
  const CustomButtonBuilderWidget({
    super.key,
    required this.driver,
    required this.source,
    required this.destination,
  });
  final DriverModel driver;
  final LatLng source, destination;

  @override
  State<CustomButtonBuilderWidget> createState() =>
      _CustomButtonBuilderWidgetState();
}

class _CustomButtonBuilderWidgetState extends State<CustomButtonBuilderWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RideCubit, RideStates>(
      listener: (context, state) async {
        if (state is CancelRequestRideState) {
          Navigator.pop(context);
        }
        if (state is SuccessRequestRideState) {
          if (state.model.rideStatus == 'Confirmed') {
            savestatus('booked');
            Navigator.pop(context);
            navigateTo(context, RideScreen(ride: state.model));
          } else if (state.model.rideStatus == 'new') {
            await Future.delayed(
              const Duration(seconds: 5),
              () {
                if (mounted && context.mounted) {
                  RideCubit.get(context).getRide();
                }
              },
            );
          }
        }
      },
      builder: (context, state) {
        if (state is SuccessRequestRideState) {
          if (state.model.rideStatus == 'new') {
            return RequestDriverButtonWidget(
              text: S.of(context).cancel_the_ride,
              onPressed: () {
                RideCubit.get(context).cancelRide();
              },
            );
          } else {
            return RequestDriverButtonWidget(
              text: S.of(context).find_another_driver,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }
        } else if (state is ErrorRequestRideState) {
          return RequestDriverButtonWidget(
            text: S.of(context).trya,
            onPressed: () {
              String uid = CacheHelper.getData(key: 'uid');
              RideCubit.get(context).requestRide(
                latS: widget.source.latitude,
                latD: widget.destination.latitude,
                lngS: widget.source.longitude,
                lngD: widget.destination.longitude,
                driverUid: widget.driver.uid ?? '',
                passengerUid: uid,
              );
            },
          );
        } else if (state is LoadingRequestRideState) {
          return Container();
        } else {
          return RequestDriverButtonWidget(
            text: S.of(context).request_the_driver,
            onPressed: () {
              String uid = CacheHelper.getData(key: 'uid');
              RideCubit.get(context).requestRide(
                latS: widget.source.latitude,
                latD: widget.destination.latitude,
                lngS: widget.source.longitude,
                lngD: widget.destination.longitude,
                driverUid: widget.driver.uid ?? '',
                passengerUid: uid,
              );
            },
          );
        }
      },
    );
  }
}
