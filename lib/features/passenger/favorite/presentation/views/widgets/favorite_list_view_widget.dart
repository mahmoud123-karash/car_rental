import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:flutter/material.dart';

import 'favorite_item_widget.dart';

class FavoriteListViewWidget extends StatelessWidget {
  const FavoriteListViewWidget({super.key, required this.list});
  final List<FavoriteModel> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => FavoriteItemWidget(
            model: list[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: list.length,
        ),
      ),
    );
  }
}
