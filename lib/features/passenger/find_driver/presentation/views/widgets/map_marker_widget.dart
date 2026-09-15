import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class MapMarkerWidget extends StatelessWidget {
  const MapMarkerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        Assets.imagesCar,
      ),
      height: 150,
      width: 150,
    );
  }
}
