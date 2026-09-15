import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LineSpacerWidget extends StatelessWidget {
  const LineSpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 5,
        height: 25,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: gryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
