import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/pick_location_sevice.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

class MapLocationPickerWidget extends StatelessWidget {
  const MapLocationPickerWidget({
    super.key,
    required this.changeS,
    required this.myLocation,
    required this.cubit,
  });
  final bool changeS;
  final LatLng myLocation;
  final MapCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MapLocationPicker(
      config: MapLocationPickerConfig(
        initialPosition: myLocation,
        apiKey: apiKey,
        onNext: (GeocodingResult? result) {
          pickLocation(
            result,
            changeS,
            cubit,
            context,
            myLocation,
          );
        },
      ),
      searchConfig: SearchConfig(
        searchHintText: changeS ? 'Pick Up Point' : 'Where you want to go',
      ),
    );
  }
}
