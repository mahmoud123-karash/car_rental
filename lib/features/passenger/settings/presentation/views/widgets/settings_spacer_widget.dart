import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsSpacerWidget extends StatelessWidget {
  const SettingsSpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        height: 0.5,
        color: blackColor,
      ),
    );
  }
}
