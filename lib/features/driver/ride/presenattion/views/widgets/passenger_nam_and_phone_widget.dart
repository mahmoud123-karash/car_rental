import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/passanger_phone_widget.dart';
import 'package:flutter/material.dart';

class PassengerNameAndPhoneWidget extends StatelessWidget {
  const PassengerNameAndPhoneWidget(
      {super.key, required this.phone, required this.name});
  final String phone, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 150,
          ),
          child: Text(
            name,
            style: TextStyles.style16,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        PassengerPhoneWidget(phone: phone)
      ],
    );
  }
}
