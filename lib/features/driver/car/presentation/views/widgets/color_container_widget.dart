import 'package:flutter/material.dart';

class ColorContainerWidget extends StatelessWidget {
  const ColorContainerWidget({super.key, required this.color});
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(color),
      ),
      width: 30,
      height: 30,
    );
  }
}
