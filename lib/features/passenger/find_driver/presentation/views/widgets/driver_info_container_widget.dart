import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_name_and_ratinf_colum_widget.dart';
import 'package:flutter/material.dart';

import 'driver_icon_chat_widget.dart';
import 'driver_icon_phone_widget.dart';
import 'driver_image_circle_avatar_widget.dart';

class DriverInfoContainerWidget extends StatelessWidget {
  const DriverInfoContainerWidget({super.key, required this.driver});
  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 9,
          horizontal: 15,
        ),
        child: Row(
          children: [
            DriverImageCircleAvatarWidget(image: driver.image ?? ''),
            const SizedBox(
              width: 14,
            ),
            DriverNameAndRatingColumWidget(
              rating: driver.rating ?? [],
              name: driver.name ?? '',
            ),
            const Spacer(),
            const DriverIconChatWidget(),
            const SizedBox(
              width: 10,
            ),
            const DriverIconPhoneWidget(),
          ],
        ),
      ),
    );
  }
}
