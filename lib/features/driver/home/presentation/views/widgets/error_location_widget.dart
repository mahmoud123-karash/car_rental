import 'package:flutter/material.dart';

import 'try_again_button_widget.dart';

class ErrorLoactionWidget extends StatelessWidget {
  const ErrorLoactionWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const TryAgainButtonWidget(),
        ],
      ),
    );
  }
}
