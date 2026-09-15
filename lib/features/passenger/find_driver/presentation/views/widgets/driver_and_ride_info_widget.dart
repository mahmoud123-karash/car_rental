import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/travel_cubit/travel_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/ride_info_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'driver_info_container_widget.dart';

class DriverAndRideInfoWidget extends StatefulWidget {
  const DriverAndRideInfoWidget(
      {super.key,
      required this.driver,
      required this.source,
      required this.destination});
  final DriverModel driver;
  final LatLng source, destination;

  @override
  State<DriverAndRideInfoWidget> createState() =>
      _DriverAndRideInfoWidgetState();
}

class _DriverAndRideInfoWidgetState extends State<DriverAndRideInfoWidget> {
  @override
  void initState() {
    TravelCubit.get(context)
        .getTravelInfo(source: widget.source, destination: widget.destination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DriverInfoContainerWidget(driver: widget.driver),
        const RideInfoBuilderWidget(),
      ],
    );
  }
}
