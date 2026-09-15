import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/profile/presentation/views/profile_screen.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PassengerNameEditWidget extends StatelessWidget {
  const PassengerNameEditWidget({super.key, required this.passenger});
  final PassangerModel passenger;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          passenger.name,
          style: TextStyles.style18.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (passenger.email != '') {
              navigateTo(
                context,
                ProfileScreen(passenger: passenger),
              );
            }
          },
          child: Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(
                  color: appColor,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: appColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
