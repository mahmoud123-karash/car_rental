import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/chat/presentation/views/chat_screen.dart';
import 'package:flutter/material.dart';

class DriverIconChatWidget extends StatelessWidget {
  const DriverIconChatWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.driverUid,
      required this.uid});
  final String name, image, driverUid, uid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            ChatScreen(
              name: name,
              image: image,
              recieverUid: driverUid,
              uid: uid,
            ));
      },
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xff4CE5B1),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(Assets.imagesMessage),
        ),
      ),
    );
  }
}
