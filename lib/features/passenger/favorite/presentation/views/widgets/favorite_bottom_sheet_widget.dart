import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/bottom_sheet_button_widget.dart';
import 'package:flutter/material.dart';

import 'favorite_map_widget.dart';

class FavoriteBottomSheetWidget extends StatelessWidget {
  const FavoriteBottomSheetWidget({
    super.key,
    required this.model,
  });
  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FavoriteMapWidget(
          name: model.name!,
          lat: model.lat!,
          lng: model.lng!,
        ),
        BottomSheetButtonWidget(
          latD: model.lat!,
          lngD: model.lng!,
          uid: model.uid!,
        ),
      ],
    );
  }
}
