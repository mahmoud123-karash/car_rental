import 'package:flutter/material.dart';

class CarBrandWidget extends StatelessWidget {
  const CarBrandWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(
        image,
      ),
    );
  }
}
