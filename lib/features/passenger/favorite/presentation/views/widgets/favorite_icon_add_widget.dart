import 'package:flutter/material.dart';

import 'icon_favorite_widget.dart';
import 'text_favotite_widget.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.address,
  });
  final String text;
  final IconData icon;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconFavoriteWidget(
            icon: icon,
            address: address,
          ),
          TextFavoriteWidget(text: text)
        ],
      ),
    );
  }
}
