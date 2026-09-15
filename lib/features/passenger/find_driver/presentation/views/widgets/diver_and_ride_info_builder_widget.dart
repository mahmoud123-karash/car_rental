import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_states.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_and_ride_info_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/new_status_builder_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/text_message_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverAndRideInfoBuilderWidget extends StatefulWidget {
  const DriverAndRideInfoBuilderWidget(
      {super.key,
      required this.driver,
      required this.source,
      required this.destination});
  final DriverModel driver;
  final LatLng source, destination;

  @override
  State<DriverAndRideInfoBuilderWidget> createState() =>
      _DriverAndRideInfoBuilderWidgetState();
}

class _DriverAndRideInfoBuilderWidgetState
    extends State<DriverAndRideInfoBuilderWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideCubit, RideStates>(
      builder: (context, state) {
        if (state is SuccessRequestRideState) {
          if (state.model.rideStatus == 'new') {
            return const NewStatusBuilderWidget();
          } else if (state.model.rideStatus == 'Cancelled') {
            return TextMessageWidget(
              message: S.of(context).driver_cancelled_ride,
            );
          } else {
            return DriverAndRideInfoWidget(
              driver: widget.driver,
              source: widget.source,
              destination: widget.destination,
            );
          }
        } else if (state is ErrorRequestRideState) {
          return Center(
            child: TextMessageWidget(message: state.message),
          );
        } else if (state is LoadingRequestRideState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return DriverAndRideInfoWidget(
            driver: widget.driver,
            source: widget.source,
            destination: widget.destination,
          );
        }
      },
    );
  }
}
