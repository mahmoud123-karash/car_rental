import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogTextFiledWidget extends StatelessWidget {
  const DialogTextFiledWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.style15.copyWith(
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: S.of(context).name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: appColor),
        ),
        prefixIcon: const Icon(
          Icons.location_on_outlined,
        ),
      ),
    );
  }
}
