import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_car_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_name_and_rate_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/request_bottom_sheet_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'driver_image_widget.dart';

class DriverItemWidget extends StatelessWidget {
  const DriverItemWidget({
    super.key,
    required this.driver,
    required this.source,
    required this.destination,
  });
  final DriverModel driver;
  final LatLng source, destination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          showAppBottomSheet(
            isDismissible: false,
            context,
            RequestBottomSheetBodyWidget(
              driver: driver,
              destination: destination,
              source: source,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DriverImageWidget(image: driver.image ?? ''),
                const SizedBox(
                  width: 10,
                ),
                DriverNameAndRatingWidget(
                  name: driver.name ?? '',
                  rating: driver.rating ?? [],
                ),
                const Spacer(),
                DriverCarWidget(
                  brand: driver.car!.brand ?? '',
                  model: driver.car!.model ?? '',
                  color: driver.car!.color ?? 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
