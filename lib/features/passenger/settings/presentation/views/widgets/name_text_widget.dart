import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class NameTextWidget extends StatelessWidget {
  const NameTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
      ),
      child: Text(
        text,
        style: TextStyles.style25,
        maxLines: 1,
      ),
    );
  }
}
