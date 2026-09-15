import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class GenderRadioWidget extends StatelessWidget {
  const GenderRadioWidget({
    super.key,
    required this.gValue,
    required this.value,
    required this.icon,
    required this.onChange,
  });
  final String gValue;
  final String value;
  final IconData icon;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: gryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RadioListTile(
          title: Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
          secondary: Icon(icon),
          value: value,
          groupValue: gValue,
          onChanged: onChange,
        ),
      ),
    );
  }
}
