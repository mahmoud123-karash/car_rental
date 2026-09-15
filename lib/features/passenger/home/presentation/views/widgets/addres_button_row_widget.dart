import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/payment_sheet_widget.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/views/pick_location_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'address_material_button_widgte.dart';

class AddressButtonRowWidget extends StatelessWidget {
  const AddressButtonRowWidget({
    super.key,
    required this.myLocation,
  });
  final LatLng myLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          AddressMaterialButtonWidget(
            text: S.of(context).book_ride,
            onTap: () {
              String message = CacheHelper.getData(key: 'status') ?? '';
              if (message == '') {
                var cubit = MapCubit.get(context);
                if (cubit.latD != null) {
                  showAppBottomSheet(
                      context,
                      PaymentSheetWidget(
                        latD: cubit.latD!,
                        latS: cubit.latS != null
                            ? cubit.latS!
                            : myLocation.latitude,
                        lngD: cubit.lngD!,
                        lngS: cubit.lngS != null
                            ? cubit.lngS!
                            : myLocation.longitude,
                      ));
                } else {
                  showToast(S.of(context).pick_location_first);
                }
              } else {
                showSnackBar(context, S.of(context).last_ride_note);
              }
            },
          ),
          const Spacer(),
          AddressMaterialButtonWidget(
            text: S.of(context).change_pick_up_point,
            onTap: () {
              String message = CacheHelper.getData(key: 'status') ?? '';
              if (message == '') {
                navigateTo(context,
                    PickLocationScreen(myLocation: myLocation, changeS: true));
              } else {
                showSnackBar(context, S.of(context).last_ride_note);
              }
            },
          )
        ],
      ),
    );
  }
}
