import 'package:flutter/material.dart';

import 'hint_text_widget.dart';
import 'sign_button_widget.dart';

class SignRowWidget extends StatelessWidget {
  const SignRowWidget({
    super.key,
    required this.text,
    required this.hText,
    this.onTap,
  });
  final String text;
  final String hText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HintTextWidget(text: hText),
        const SizedBox(
          width: 5,
        ),
        SignButtonWidget(text: text, onTap: onTap),
      ],
    );
  }
}
