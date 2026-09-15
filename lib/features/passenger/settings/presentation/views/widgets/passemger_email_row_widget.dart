import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PassengerEmailRowWidget extends StatelessWidget {
  const PassengerEmailRowWidget({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.email,
          color: appColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          email,
          style: TextStyles.style14,
        ),
      ],
    );
  }
}
