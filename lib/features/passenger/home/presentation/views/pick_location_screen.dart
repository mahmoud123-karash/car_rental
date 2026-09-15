import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_states.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/loading_draw_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

import 'widgets/map_location_picker_widget.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({
    super.key,
    required this.myLocation,
    required this.changeS,
  });
  final LatLng myLocation;
  final bool changeS;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        var cubit = MapCubit.get(context);
        return Stack(
          alignment: Alignment.center,
          children: [
            MapLocationPickerWidget(
              changeS: changeS,
              myLocation: myLocation,
              cubit: cubit,
            ),
            if (state is LoadingDrawLineState) const LoadingDrawLineWidget(),
          ],
        );
      },
    );
  }
}
