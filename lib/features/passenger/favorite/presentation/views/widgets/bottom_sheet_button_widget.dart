import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/payment_sheet_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'button_sheet_material_button_widget.dart';

class BottomSheetButtonWidget extends StatelessWidget {
  const BottomSheetButtonWidget({
    super.key,
    required this.latD,
    required this.lngD,
    required this.uid,
  });
  final double latD;
  final double lngD;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          ButtomSheetMaterialButtonWidget(
            onTap: () {
              String message = CacheHelper.getData(key: 'status') ?? '';
              if (message == '') {
                double latS = CacheHelper.getData(key: 'lat');
                double lngS = CacheHelper.getData(key: 'lng');
                Navigator.pop(context);
                showAppBottomSheet(
                  context,
                  PaymentSheetWidget(
                    latD: latD,
                    lngD: lngD,
                    latS: latS,
                    lngS: lngS,
                  ),
                );
              } else {
                showToast(
                  S.of(context).last_ride_note,
                  gravity: ToastGravity.TOP,
                );
              }
            },
            text: S.of(context).book_ride,
          ),
          const Spacer(),
          ButtomSheetMaterialButtonWidget(
            text: S.of(context).delete,
            onTap: () {
              Navigator.pop(context);
              FavoriteCubit.get(context).deleteFavorite(
                uid: uid,
              );
            },
          ),
        ],
      ),
    );
  }
}
