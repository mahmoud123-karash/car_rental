import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MessageHomeBuilderWidget extends StatelessWidget {
  const MessageHomeBuilderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          message,
          style: TextStyles.style16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
