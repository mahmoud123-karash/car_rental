import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddressRowWidget extends StatelessWidget {
  const AddressRowWidget(
      {super.key, required this.address, required this.color});
  final String address;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_rounded,
          color: color,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFD1D1D1),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                address,
                style: TextStyles.style12,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        )
      ],
    );
  }
}
