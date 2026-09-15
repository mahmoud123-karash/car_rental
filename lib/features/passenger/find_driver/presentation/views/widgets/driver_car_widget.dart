import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_car_logo_brand_widget.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_car_name_and_color_widget.dart';
import 'package:flutter/material.dart';

class DriverCarWidget extends StatelessWidget {
  const DriverCarWidget({
    super.key,
    required this.brand,
    required this.model,
    required this.color,
  });
  final String brand;
  final String model;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DriverCarLogoBrandWidget(
          brand: brand,
        ),
        DriverCarNameAndColorWidget(
          model: model,
          color: color,
        )
      ],
    );
  }
}
