import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PassengerPhoneRowWidget extends StatelessWidget {
  const PassengerPhoneRowWidget({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.phone,
          color: appColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          phone,
          style: TextStyles.style14,
        ),
      ],
    );
  }
}
