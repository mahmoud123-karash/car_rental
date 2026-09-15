import 'package:car_rental/features/passenger/home/presentation/views/widgets/addres_button_row_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/constants/constants.dart';
import 'address_container_widget.dart';

class SetDestinationHomeWidget extends StatelessWidget {
  const SetDestinationHomeWidget({super.key, required this.myLocation});
  final LatLng myLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: 215,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor.withOpacity(0.8),
          border: Border.all(
            color: appColor,
          ),
        ),
        child: Column(
          children: [
            AddressContainerWidget(
              myLocation: myLocation,
            ),
            AddressButtonRowWidget(
              myLocation: myLocation,
            ),
          ],
        ),
      ),
    );
  }
}
