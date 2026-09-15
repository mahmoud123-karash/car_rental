import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/favorite_bottom_sheet_widget.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/icon_item_favorite_widget.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/item_name_address_widget.dart';
import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key, required this.model});
  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      hoverColor: gryColor,
      onTap: () async {
        showAppBottomSheet(
          context,
          FavoriteBottomSheetWidget(
            model: model,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconItemFavoriteWidget(
                icon: getIcon(model.type),
              ),
              const SizedBox(
                width: 25,
              ),
              ItemNameAddressWidget(
                address: model.name ?? '',
                title: '${model.type} Address',
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  FavoriteCubit.get(context).deleteFavorite(uid: model.uid!);
                },
                icon: const Icon(
                  Icons.delete_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
