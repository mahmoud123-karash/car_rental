import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/driver/home/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/driver/home/data/repo/home_repo_impl.dart';
import 'package:car_rental/features/driver/home/presentation/manager/ride_cubit/ride_cubit.dart';
import 'package:car_rental/features/driver/home/presentation/manager/ride_cubit/ride_states.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/earning_and_booking_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EaringAndRequestBuilderWidget extends StatelessWidget {
  const EaringAndRequestBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideCubit(
        getIt.get<HomeRepoIml>(),
      )..getRides(),
      child: BlocBuilder<RideCubit, RideStates>(
        builder: (context, state) {
          if (state is SuccessGetRidesState) {
            return EarningAndBookingRowWidget(model: state.model);
          } else {
            return EarningAndBookingRowWidget(
              model: RideModel(
                completedRides: [],
                todayRides: [],
              ),
            );
          }
        },
      ),
    );
  }
}
