import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/passenger_name_edit_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/passenger_phone_row_widget.dart';
import 'package:flutter/material.dart';

import 'passemger_email_row_widget.dart';

class PassengerInfoContainerWidegt extends StatelessWidget {
  const PassengerInfoContainerWidegt({super.key, required this.passenger});
  final PassangerModel passenger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gryColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PassengerNameEditWidget(passenger: passenger),
              const SizedBox(
                height: 6,
              ),
              PassengerEmailRowWidget(email: passenger.email),
              const SizedBox(
                height: 8,
              ),
              PassengerPhoneRowWidget(phone: passenger.phone),
            ],
          ),
        ),
      ),
    );
  }
}
