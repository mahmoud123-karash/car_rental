import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class DriverCarLogoBrandWidget extends StatelessWidget {
  const DriverCarLogoBrandWidget({super.key, required this.brand});
  final String brand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 35,
      child: Image.asset(
        brand == '' ? Assets.imagesCar : brand,
      ),
    );
  }
}
