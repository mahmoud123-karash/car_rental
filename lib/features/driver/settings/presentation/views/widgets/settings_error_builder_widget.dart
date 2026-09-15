import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsErrorBuilderWidget extends StatelessWidget {
  const SettingsErrorBuilderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: 20,
            color: appColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
