import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SendTextFieldWidget extends StatefulWidget {
  const SendTextFieldWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<SendTextFieldWidget> createState() => _SendTextFieldWidgetState();
}

class _SendTextFieldWidgetState extends State<SendTextFieldWidget> {
  int lines = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gryColor.withOpacity(0.3),
        ),
        child: TextFormField(
          maxLines: lines,
          onChanged: (value) {
            if (value.length > 30) {
              lines = 2;
            } else {
              lines = 1;
            }
            setState(() {});
          },
          controller: widget.controller,
          style: TextStyles.style16Bold.copyWith(
            fontFamily: '',
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: 'Type a message',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
