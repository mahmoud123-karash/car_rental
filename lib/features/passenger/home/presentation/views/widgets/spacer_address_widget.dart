import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SpacerAddressWidget extends StatelessWidget {
  const SpacerAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: blackColor,
        height: 0.5,
      ),
    );
  }
}
