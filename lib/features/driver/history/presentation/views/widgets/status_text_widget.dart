import 'package:flutter/material.dart';

class StatusTextWidget extends StatelessWidget {
  const StatusTextWidget({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: status == 'Cancelled'
            ? const Color(0xFFFCECEF)
            : status == 'Confirmed'
                ? const Color.fromARGB(255, 149, 178, 244)
                : const Color(0xFFE7FBF0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: status == 'Cancelled'
                ? const Color(0xFFFBCCD6)
                : status == 'Confirmed'
                    ? const Color(0xff043565)
                    : const Color(0xFFD8F4E4),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 5,
        ),
        child: Text(
          status,
          style: TextStyle(
            color: status == 'Cancelled'
                ? const Color(0xFFF52D56)
                : status == 'Confirmed'
                    ? const Color(0xff043565)
                    : const Color(0xFF18C160),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
    );
  }
}
