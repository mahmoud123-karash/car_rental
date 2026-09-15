import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/travel_cubit/travel_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/travel_cubit/travel_states.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/ride_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideInfoBuilderWidget extends StatelessWidget {
  const RideInfoBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelCubit, TravelStates>(
      builder: (context, state) {
        if (state is SuccessGEtTravelInfoState) {
          return RideInfoWidget(
            travelEntity: state.model,
          );
        } else if (state is ErrorGetTravelInfoState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(
                color: gryColor.withOpacity(0.4),
              ),
            ),
          );
        }
      },
    );
  }
}
