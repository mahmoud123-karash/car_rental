import 'package:flutter/material.dart';

class DriverCarNameAndColorWidget extends StatelessWidget {
  const DriverCarNameAndColorWidget(
      {super.key, required this.model, required this.color});
  final String model;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 70,
          ),
          child: Text(
            model,
            maxLines: 1,
          ),
        ),
        Container(
          width: 10,
          height: 10,
          color: Color(
            color,
          ),
        )
      ],
    );
  }
}
