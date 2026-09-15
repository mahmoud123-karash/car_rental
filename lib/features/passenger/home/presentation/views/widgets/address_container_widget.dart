import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/home/presentation/views/pick_location_screen.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/address_text_builder_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressContainerWidget extends StatelessWidget {
  const AddressContainerWidget({
    super.key,
    required this.myLocation,
  });
  final LatLng myLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String message = CacheHelper.getData(key: 'status') ?? '';
        if (message == '') {
          navigateTo(context,
              PickLocationScreen(myLocation: myLocation, changeS: false));
        } else {
          showSnackBar(context, S.of(context).last_ride_note);
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: AddressTextBuilderWidget(),
      ),
    );
  }
}
