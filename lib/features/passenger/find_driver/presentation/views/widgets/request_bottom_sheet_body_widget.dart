import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/domain/use_cases/request_ride_use_case.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/custom_button_builder_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/diver_and_ride_info_builder_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RequestBottomSheetBodyWidget extends StatelessWidget {
  const RequestBottomSheetBodyWidget({
    super.key,
    required this.driver,
    required this.source,
    required this.destination,
  });
  final DriverModel driver;
  final LatLng source, destination;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideCubit(
        getIt.get<RequestRideUseCase>(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DriverAndRideInfoBuilderWidget(
            driver: driver,
            source: source,
            destination: destination,
          ),
          CustomButtonBuilderWidget(
            driver: driver,
            source: source,
            destination: destination,
          ),
        ],
      ),
    );
  }
}
