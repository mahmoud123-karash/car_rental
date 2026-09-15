import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PriceAndDateWidget extends StatelessWidget {
  const PriceAndDateWidget(
      {super.key, required this.price, required this.time});
  final String price, time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price,
          style: TextStyles.style24.copyWith(color: appColor),
        ),
        const Spacer(),
        Text(
          time,
          style: TextStyles.style14,
        ),
      ],
    );
  }
}
