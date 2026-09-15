import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).hello,
      style: TextStyles.style25Bold.copyWith(color: appColor),
    );
  }
}
