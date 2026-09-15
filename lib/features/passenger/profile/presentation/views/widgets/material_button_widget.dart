import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 40,
      ),
      child: MaterialButton(
        color: appColor,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: appColor,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Save',
            style: TextStyles.style20,
          ),
        ),
      ),
    );
  }
}
