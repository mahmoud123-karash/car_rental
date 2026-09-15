import 'package:flutter/material.dart';

import 'item_row_address_widget.dart';
import 'text_item_favorite_widget.dart';

class ItemNameAddressWidget extends StatelessWidget {
  const ItemNameAddressWidget({
    super.key,
    required this.address,
    required this.title,
  });
  final String address;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextItemFavoriteWidget(
          title: title,
        ),
        const SizedBox(
          height: 5,
        ),
        ItemRowAddressWidget(address: address),
      ],
    );
  }
}
