import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class PublicTextWidget extends StatelessWidget {
  const PublicTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 20,
        bottom: 5,
      ),
      child: Text(
        S.of(context).public_settings,
        style: TextStyles.style20.copyWith(
          color: appColor,
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
