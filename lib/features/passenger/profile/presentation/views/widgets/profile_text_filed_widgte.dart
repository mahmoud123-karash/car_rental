import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileTextFiledWidget extends StatelessWidget {
  const ProfileTextFiledWidget({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.autovalidateMode,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: gryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          style: TextStyles.style20,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This filed is required';
            }
            return null;
          },
          keyboardType: keyboardType,
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
