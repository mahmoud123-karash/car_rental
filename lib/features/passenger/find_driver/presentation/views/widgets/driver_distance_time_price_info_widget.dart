import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';
import 'package:flutter/material.dart';

import 'key_value_colum_widget.dart';

class DriverDistanceTimePriceInfoWidget extends StatelessWidget {
  const DriverDistanceTimePriceInfoWidget(
      {super.key, required this.travelEntity});
  final TravelEntity travelEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesRcar),
          const SizedBox(
            width: 34,
          ),
          KeyValueColumWidget(
            dKey: "Distance",
            value: travelEntity.distance,
          ),
          const SizedBox(
            width: 36,
          ),
          KeyValueColumWidget(
            dKey: "Time",
            value: travelEntity.time,
          ),
          const SizedBox(
            width: 36,
          ),
          KeyValueColumWidget(
            dKey: "Price",
            value:
                '\$${((double.parse(travelEntity.distance.split(' ')[0])) * 10).toStringAsFixed(0)}',
          ),
        ],
      ),
    );
  }
}
