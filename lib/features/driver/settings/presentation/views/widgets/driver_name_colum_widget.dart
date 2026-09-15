import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DriverNameColumWidget extends StatelessWidget {
  const DriverNameColumWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyles.style20Bold.copyWith(
            color: appColor,
          ),
        ),
        Text(
          name,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
