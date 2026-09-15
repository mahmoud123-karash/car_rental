import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class CiecleAvatarimageWidget extends StatelessWidget {
  const CiecleAvatarimageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage(
        Assets.imagesProfile,
      ),
    );
  }
}
