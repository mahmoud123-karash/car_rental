import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'text_address_item_favorite_widget.dart';

class ItemRowAddressWidget extends StatelessWidget {
  const ItemRowAddressWidget({
    super.key,
    required this.address,
  });
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: gryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        TextAddressItemFavoriteWidget(
          address: address,
        ),
      ],
    );
  }
}
