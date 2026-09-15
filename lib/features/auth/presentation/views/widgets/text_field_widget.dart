import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.lable,
    required this.textInputType,
    required this.textEditingController,
    required this.icon,
    required this.autovalidateMode,
  });
  final String lable;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final IconData icon;
  final AutovalidateMode autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gryColor.withOpacity(0.4),
      ),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).field_required;
          }
          return null;
        },
        style: TextStyles.style20,
        keyboardType: textInputType,
        controller: textEditingController,
        decoration: InputDecoration(
          errorText: null,
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: appColor,
          ),
          label: Text(
            lable,
          ),
        ),
      ),
    );
  }
}
