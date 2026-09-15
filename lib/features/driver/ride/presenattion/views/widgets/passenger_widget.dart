import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/passenger_icon_widget.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/passenger_nam_and_phone_widget.dart';
import 'package:car_rental/features/passenger/chat/presentation/views/chat_screen.dart';
import 'package:flutter/material.dart';

class PassengerWidget extends StatelessWidget {
  const PassengerWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.uid,
    required this.recieverUid,
  });
  final String name, phone, uid, recieverUid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 34,
          backgroundImage: AssetImage(
            Assets.imagesProfile,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        PassengerNameAndPhoneWidget(
          phone: phone,
          name: name,
        ),
        const Spacer(),
        PassengerIconWidget(
          onPressed: () {
            final Uri phoneLaunchUri = Uri(
              scheme: 'tel',
              path: phone,
            );

            openUri(url: phoneLaunchUri);
          },
          icon: Icons.phone,
        ),
        const SizedBox(
          width: 10,
        ),
        PassengerIconWidget(
          onPressed: () {
            navigateTo(
              context,
              ChatScreen(
                name: name,
                image: '',
                recieverUid: recieverUid,
                uid: uid,
              ),
            );
          },
          icon: Icons.chat,
        ),
      ],
    );
  }
}
