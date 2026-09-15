import 'package:flutter/material.dart';

class CircleAvatarImageProfileWidget extends StatelessWidget {
  const CircleAvatarImageProfileWidget({
    super.key,
    required this.backgroundImage,
  });
  final ImageProvider<Object> backgroundImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: backgroundImage,
    );
  }
}
