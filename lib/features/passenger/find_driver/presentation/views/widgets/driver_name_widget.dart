import 'package:flutter/material.dart';

class DriverNameWidget extends StatelessWidget {
  const DriverNameWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 150,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
      ),
    );
  }
}
