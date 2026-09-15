import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileTextWidget extends StatelessWidget {
  const ProfileTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Text(
        text,
        style: TextStyles.style20Bold.copyWith(
          color: gryColor,
        ),
      ),
    );
  }
}
