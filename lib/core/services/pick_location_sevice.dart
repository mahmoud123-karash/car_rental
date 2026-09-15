import 'package:car_rental/core/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:map_location_picker/map_location_picker.dart';

void pickLocation(
  GeocodingResult? result,
  changeS,
  cubit,
  context,
  myLocation,
) {
  final location = result?.geometry?.location;
  if (result != null && location != null) {
    if (!changeS) {
      cubit.latD = location.lat;
      cubit.lngD = location.lng;
      cubit.dAddress = result.formattedAddress ?? '';
      cubit.drawLineFromSToD(
        context: context,
        source: PointLatLng(
          cubit.latS != null ? cubit.latS! : myLocation.latitude,
          cubit.lngS != null ? cubit.lngS! : myLocation.longitude,
        ),
        destination: PointLatLng(
          location.lat,
          location.lng,
        ),
      );
    } else {
      cubit.latS = location.lat;
      cubit.lngS = location.lng;
      cubit.sAddress = result.formattedAddress ?? '';

      if (cubit.latD == null) {
        Navigator.pop(context);
      } else {
        cubit.drawLineFromSToD(
          context: context,
          source: PointLatLng(
            location.lat,
            location.lng,
          ),
          destination: PointLatLng(
            cubit.latD!,
            cubit.lngD!,
          ),
        );
      }
    }
  } else {
    showSnackBar(context, 'Loading......');
  }
}
