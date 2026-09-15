import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'driver_icon_chat_widget.dart';
import 'driver_icon_phone_widget.dart';
import 'driver_image_circle_avatar_widget.dart';
import 'driver_name_and_ratinf_colum_widget.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.image,
    required this.rating,
    required this.driverUid,
    required this.uid,
  });
  final String name, phone, image, rating, driverUid, uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: gryColor.withOpacity(0.3),
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            DriverImageCircleAvatarWidget(image: image),
            const SizedBox(
              width: 10,
            ),
            DriverNameAndRatingColumWidget(
              rating: rating,
              name: name,
            ),
            const Spacer(),
            DriverIconChatWidget(
              name: name,
              image: image,
              driverUid: driverUid,
              uid: uid,
            ),
            const SizedBox(
              width: 5,
            ),
            DriverIconPhoneWidget(phone: phone),
          ],
        ),
      ),
    );
  }
}
