import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

import 'loading_builder_widget.dart';

class MapLocationPickerWidget extends StatefulWidget {
  const MapLocationPickerWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<MapLocationPickerWidget> createState() =>
      _MapLocationPickerWidgetState();
}

class _MapLocationPickerWidgetState extends State<MapLocationPickerWidget> {
  late String address;
  late LatLng location;
  @override
  void initState() {
    double lat = CacheHelper.getData(key: 'lat') ?? 0;
    double lng = CacheHelper.getData(key: 'lng') ?? 0;

    location = LatLng(lat, lng);
    address = CacheHelper.getData(key: 'address') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MapLocationPicker(
          config: MapLocationPickerConfig(
            initialPosition: location,
            apiKey: apiKey,
            language: 'en',
            onNext: (GeocodingResult? result) {
              final loc = result?.geometry?.location;
              if (loc != null) {
                FavoriteCubit.get(context).addFavorite(
                  name: widget.controller.text,
                  lat: loc.lat,
                  lng: loc.lng,
                  type: address,
                );
              }
            },
          ),
          searchConfig: SearchConfig(
            searchHintText: 'Add $address address',
          ),
        ),
        const LoadingBuilderWidget(),
      ],
    );
  }
}
