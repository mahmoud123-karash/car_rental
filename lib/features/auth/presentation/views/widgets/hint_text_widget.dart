import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HintTextWidget extends StatelessWidget {
  const HintTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.style15.copyWith(
        color: blackColor.withOpacity(0.5),
      ),
    );
  }
}
