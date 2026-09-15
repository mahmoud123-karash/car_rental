// ignore_for_file: use_build_context_synchronously

import 'package:car_rental/core/services/map_services.dart';
import 'package:car_rental/features/passenger/home/doamin/use_cases/draw_line_use_case.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit(this.drawLineUseCase) : super(InitialMapState());
  static MapCubit get(context) => BlocProvider.of(context);

  final DrawLineUseCase drawLineUseCase;

  String sAddress = '';
  double? latS;
  double? lngS;

  String dAddress = '';
  double? latD;
  double? lngD;

  Set<Polyline> lines = {};
  Set<Marker> markers = {};
  void drawLineFromSToD({
    required PointLatLng source,
    required PointLatLng destination,
    required BuildContext context,
  }) async {
    emit(LoadingDrawLineState());
    lines.clear();
    markers.clear();

    List<LatLng> points = await drawLineUseCase.draw(
      source: source,
      destination: destination,
    );

    Polyline p = pLine(points);
    Marker sM = sMarker(source);
    Marker dM = dMarker(destination);

    lines.add(p);
    markers.addAll([sM, dM]);
    Navigator.pop(context);
    emit(SuccessDrawLineState());
  }
}
