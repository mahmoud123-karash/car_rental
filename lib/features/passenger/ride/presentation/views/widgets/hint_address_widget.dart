import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HintAddessWidget extends StatelessWidget {
  const HintAddessWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.style13,
    );
  }
}
