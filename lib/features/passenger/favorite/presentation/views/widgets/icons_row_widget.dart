import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/favorite_icon_add_widget.dart';
import 'package:flutter/material.dart';

class IconsRowWidget extends StatelessWidget {
  const IconsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FavoriteIconWidget(
          text: 'Add Home Address',
          icon: Icons.home,
          address: 'Home',
        ),
        FavoriteIconWidget(
          text: 'Add Work Address',
          icon: Icons.work,
          address: 'Work',
        ),
        FavoriteIconWidget(
          text: 'Add Gym Address',
          icon: Icons.fitness_center_outlined,
          address: 'Gym',
        ),
        FavoriteIconWidget(
          text: 'Add Favorite Address',
          icon: Icons.favorite,
          address: 'Favorite',
        )
      ],
    );
  }
}
