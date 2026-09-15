import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DriverRatingRowWidget extends StatelessWidget {
  const DriverRatingRowWidget({
    super.key,
    required this.rating,
  });
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 32,
          color: Color(0xffFFCC00),
        ),
        Text(
          rating,
          style: TextStyles.style15.copyWith(
            fontFamily: 'SF UI Display',
          ),
        ),
      ],
    );
  }
}
