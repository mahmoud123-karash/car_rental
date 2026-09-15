import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.lable,
    required this.onpressed,
  });
  final String lable;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: appColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
      onPressed: onpressed,
      child: Center(
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextStyles.style18.copyWith(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
