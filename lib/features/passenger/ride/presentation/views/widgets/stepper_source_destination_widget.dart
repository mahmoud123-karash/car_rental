import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StepperSourceDestinationWidget extends StatelessWidget {
  const StepperSourceDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            width: 5,
            height: 30,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  width: 5,
                  height: 5,
                  color: gryColor,
                ),
              ),
              itemCount: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 17,
        ),
        Container(
          width: appSize(context).width - 100,
          height: 0.2,
          color: blackColor,
        )
      ],
    );
  }
}
