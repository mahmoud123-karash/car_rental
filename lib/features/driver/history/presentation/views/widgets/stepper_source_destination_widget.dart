import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StepperSourceDestinationWidget extends StatelessWidget {
  const StepperSourceDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.5),
      child: SizedBox(
        width: 6,
        height: 20,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: gryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
