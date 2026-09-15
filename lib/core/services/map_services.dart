import 'package:car_rental/core/constants/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Polyline pLine(points) => Polyline(
      polylineId: const PolylineId('value'),
      points: points,
      color: appColor,
      width: 5,
    );

Marker sMarker(source) => Marker(
      markerId: const MarkerId('_source'),
      position: LatLng(source.latitude, source.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(45),
    );

Marker dMarker(destination) => Marker(
      markerId: const MarkerId('_destination'),
      position: LatLng(destination.latitude, destination.longitude),
      icon: BitmapDescriptor.defaultMarker,
    );
