import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        width: appSize(context).width / 3 - 15,
        height: 15,
      ),
    );
  }
}
