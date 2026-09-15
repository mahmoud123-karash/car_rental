import 'package:car_rental/features/passenger/home/doamin/repo/home_repo.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawLineUseCase {
  final HomeRepo homeRepo;

  DrawLineUseCase(this.homeRepo);
  Future<List<LatLng>> draw({
    required PointLatLng source,
    required PointLatLng destination,
  }) async {
    PolylineResult result = await homeRepo.drawLinrFSToD(
      source: source,
      destination: destination,
    );
    List<LatLng> points = [];
    for (var element in result.points) {
      LatLng e = LatLng(element.latitude, element.longitude);
      points.add(e);
    }

    return points;
  }
}
