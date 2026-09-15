import 'package:flutter/material.dart';

class ProfileTextFiledWidget extends StatelessWidget {
  const ProfileTextFiledWidget({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.onTap,
    required this.autovalidateMode,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback onTap;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This filed is required';
        }
        return null;
      },
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 5),
        ),
      ),
    );
  }
}
