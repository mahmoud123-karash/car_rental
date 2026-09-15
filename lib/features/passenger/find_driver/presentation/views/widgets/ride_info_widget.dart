import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_distance_time_price_info_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/source_to_destination_widget.dart';
import 'package:flutter/material.dart';

class RideInfoWidget extends StatelessWidget {
  const RideInfoWidget({super.key, required this.travelEntity});
  final TravelEntity travelEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SourceToDestinationWidget(
          sAddress: travelEntity.sourceAddress,
          dAddress: travelEntity.destinationAddress,
        ),
        const Divider(),
        DriverDistanceTimePriceInfoWidget(travelEntity: travelEntity),
      ],
    );
  }
}
