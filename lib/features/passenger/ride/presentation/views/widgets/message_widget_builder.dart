import 'package:flutter/material.dart';

class MessageBuilderWidget extends StatelessWidget {
  const MessageBuilderWidget(
      {super.key, required this.message, required this.color});
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: color,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
