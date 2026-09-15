import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class StepTextWidget extends StatelessWidget {
  const StepTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Text(
        text,
        style: TextStyles.style20Bold,
      ),
    );
  }
}
