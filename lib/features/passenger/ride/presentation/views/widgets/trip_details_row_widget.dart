import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TripDetailsRowWidget extends StatelessWidget {
  const TripDetailsRowWidget(
      {super.key, required this.text, required this.value});
  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyles.style13.copyWith(
              color: blackColor.withOpacity(0.8),
            ),
          ),
          const Spacer(),
          Container(
            constraints: const BoxConstraints(maxWidth: 130),
            child: Text(
              value,
              style: TextStyles.style12,
              maxLines: 1,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
