import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.color,
      required this.lable,
      required this.onPressed});
  final Color color;
  final String lable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: color,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              lable,
              style: TextStyles.style18.copyWith(
                fontFamily: '',
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
