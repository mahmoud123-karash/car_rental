import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StepperSourceDestinationWidget extends StatelessWidget {
  const StepperSourceDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            width: 5,
            height: 30,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: gryColor.withOpacity(0.6),
                  ),
                  height: 5,
                ),
              ),
              itemCount: 10,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12 + 5),
          child: Container(
            color: blackColor,
            width: appSize(context).width - 65,
            height: 0.2,
          ),
        ),
      ],
    );
  }
}
