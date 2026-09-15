import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/step_widget.dart';
import 'package:flutter/material.dart';

class SteperWidget extends StatelessWidget {
  const SteperWidget({
    super.key,
    required this.step,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });
  final int step;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap1,
            child: StepWidget(color: appColor),
          ),
          GestureDetector(
            onTap: onTap2,
            child: StepWidget(
              color: step != 1 ? appColor : gryColor,
            ),
          ),
          GestureDetector(
            onTap: onTap3,
            child: StepWidget(
              color: step == 3 ? appColor : gryColor,
            ),
          ),
        ],
      ),
    );
  }
}
