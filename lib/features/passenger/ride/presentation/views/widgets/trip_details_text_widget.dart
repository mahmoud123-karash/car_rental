import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class TripDetailsTextWidget extends StatelessWidget {
  const TripDetailsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        S.of(context).trip_details,
        style: TextStyles.style13.copyWith(
          color: blackColor,
        ),
      ),
    );
  }
}
