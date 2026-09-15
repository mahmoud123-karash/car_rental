import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'message_widget_builder.dart';

class MapBuilderWidget extends StatefulWidget {
  const MapBuilderWidget({
    super.key,
    required this.source,
    required this.destination,
    required this.uid,
  });
  final LatLng source, destination;
  final String uid;

  @override
  State<MapBuilderWidget> createState() => _MapBuilderWidgetState();
}

class _MapBuilderWidgetState extends State<MapBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) {
        if (state is SuceesGetLocationState) {
          Future.delayed(const Duration(seconds: 30)).then((value) {
            if (mounted && context.mounted) {
              MapCubit.get(context).getLocation(
                uid: widget.uid,
                source: widget.source,
              );
            }
          });
        }
      },
      builder: (context, state) {
        if (state is ErrorGetLocationState) {
          return MessageBuilderWidget(
            message: state.message,
            color: blackColor,
          );
        }
        return MapWidget(
          destination: widget.destination,
          source: widget.source,
        );
      },
    );
  }
}
