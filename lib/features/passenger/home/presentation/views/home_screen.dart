import 'package:car_rental/features/passenger/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/location_cubit/location_states.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/home_error_widget.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/home_map_widget.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/set_destination_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit, LocationStates>(
        builder: (context, state) {
          if (state is LocatonChangedErrorState) {
            return HomeErrorWidget(message: state.message);
          } else if (state is LocatonChangedSuccessState) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                HomeMapWidget(
                  myLocation: state.myLocation,
                ),
                SetDestinationHomeWidget(myLocation: state.myLocation),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }
        },
      ),
    );
  }
}
