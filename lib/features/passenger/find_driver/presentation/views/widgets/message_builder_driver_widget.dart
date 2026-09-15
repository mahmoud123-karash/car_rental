import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageBuilderDriverWidget extends StatelessWidget {
  const MessageBuilderDriverWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: appSize(context).height / 2 - 200,
        left: 15,
        right: 15,
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
