import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_states.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'error_location_widget.dart';
import 'map_widget.dart';

class MapBuilderWidget extends StatefulWidget {
  const MapBuilderWidget({super.key});

  @override
  State<MapBuilderWidget> createState() => _MapBuilderWidgetState();
}

class _MapBuilderWidgetState extends State<MapBuilderWidget> {
  @override
  void initState() {
    bool isNew = CacheHelper.getData(key: 'new') ?? false;
    if (isNew) {
      LoctionCubit.get(context).getLocation();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoctionCubit, LoactionStates>(
      builder: (context, state) {
        if (state is SucessGetLocationState) {
          return MapWidget(
            myLocation: LatLng(state.lat, state.lng),
          );
        } else if (state is ErrorGetLoactionState) {
          return ErrorLoactionWidget(message: state.message);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
