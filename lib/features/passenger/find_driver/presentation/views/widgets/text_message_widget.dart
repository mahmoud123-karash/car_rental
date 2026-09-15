import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyles.style16Bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
