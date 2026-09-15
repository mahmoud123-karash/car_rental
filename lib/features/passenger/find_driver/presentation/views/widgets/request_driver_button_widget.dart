import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class RequestDriverButtonWidget extends StatelessWidget {
  const RequestDriverButtonWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        color: appColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.style17.copyWith(
                fontFamily: 'SF UI Display',
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
