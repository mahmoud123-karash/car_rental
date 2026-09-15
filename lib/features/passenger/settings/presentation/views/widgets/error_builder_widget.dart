import 'package:flutter/material.dart';

class ErrorBuilderWidget extends StatelessWidget {
  const ErrorBuilderWidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          error,
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
