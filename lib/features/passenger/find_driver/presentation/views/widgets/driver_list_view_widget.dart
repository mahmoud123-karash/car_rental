import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverListViewWidget extends StatelessWidget {
  const DriverListViewWidget({
    super.key,
    required this.drivers,
    required this.source,
    required this.destination,
  });
  final List<DriverModel> drivers;
  final LatLng source, destination;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: drivers.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) => DriverItemWidget(
          destination: destination,
          source: source,
          driver: drivers[index],
        ),
      ),
    );
  }
}
