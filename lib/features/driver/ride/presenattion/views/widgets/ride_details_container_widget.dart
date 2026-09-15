import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/ride/data/data_sources/remote_data_source/ride_remote_data_source.dart';
import 'package:car_rental/features/driver/ride/data/repo/ride_repo_impl.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/arrived_cubit/arrived_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/passanger_cubit/passenger_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/passenger_builder_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'address_row_widget.dart';
import 'arrived_custom_button_builder_widget.dart';
import 'stepper_source_destination_widget.dart';

class RideDetailsContainerWidget extends StatelessWidget {
  const RideDetailsContainerWidget({super.key, required this.model});
  final RequestModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => PassengerCubit(
                RideRepoImpl(
                  RideRemoteDataSourceImpl(),
                ),
              )..getPassenger(uid: model.passengerUid),
              child: PassengerBuilderWidget(
                recieverUid: model.passengerUid,
                uid: model.rideUid,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            AddressRowWidget(
              address: model.sAddress,
              color: Colors.greenAccent,
            ),
            const StepperSourceDestinationWidget(),
            AddressRowWidget(
              address: model.dAddress,
              color: Colors.red,
            ),
            const SizedBox(
              height: 25,
            ),
            BlocProvider(
              create: (context) => ArrivedCubit(),
              child: ArrivedCustomButtonBuilderWidget(uid: model.rideUid),
            ),
          ],
        ),
      ),
    );
  }
}
