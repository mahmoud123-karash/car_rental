import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PassengerPhoneWidget extends StatelessWidget {
  const PassengerPhoneWidget({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.phone,
          size: 18,
          color: appColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 100,
          ),
          child: Text(
            phone,
            style: TextStyles.style14,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
