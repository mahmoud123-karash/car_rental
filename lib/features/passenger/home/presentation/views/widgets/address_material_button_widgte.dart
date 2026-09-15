import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddressMaterialButtonWidget extends StatelessWidget {
  const AddressMaterialButtonWidget(
      {super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appColor),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyles.style16Bold.copyWith(
          color: appColor,
        ),
      ),
    );
  }
}
