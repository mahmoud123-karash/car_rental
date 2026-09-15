import 'package:flutter/material.dart';

class IconItemFavoriteWidget extends StatelessWidget {
  const IconItemFavoriteWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 35,
      color: Colors.black54,
    );
  }
}
