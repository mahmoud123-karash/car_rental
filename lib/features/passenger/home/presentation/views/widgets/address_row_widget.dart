import 'package:flutter/material.dart';

import 'address_colum_widget.dart';

class AddressRowWidget extends StatelessWidget {
  const AddressRowWidget({
    super.key,
    required this.text,
    required this.address,
    required this.color,
  });
  final String text;
  final String address;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          size: 30,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        AddressColumWidget(address: address, text: text),
      ],
    );
  }
}
