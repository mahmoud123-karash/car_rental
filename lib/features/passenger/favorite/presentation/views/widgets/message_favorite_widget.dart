import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageFavoriteWidget extends StatelessWidget {
  const MessageFavoriteWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: appSize(context).height / 2 - 200,
      ),
      child: Center(
        child: Text(
          text,
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
