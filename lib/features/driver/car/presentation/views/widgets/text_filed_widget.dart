import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.autovalidateMode,
  });
  final TextEditingController controller;
  final TextInputType textInputType;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 5,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gryColor.withOpacity(0.5),
        ),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This filed is required';
            }
            return null;
          },
          controller: controller,
          keyboardType: textInputType,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
