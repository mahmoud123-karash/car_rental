import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class RequestButtonRowWidget extends StatelessWidget {
  const RequestButtonRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWidget(
          text: 'Request The Driver',
          onPressed: () {},
        ),
        CustomButtonWidget(
          text: 'Cancel',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
