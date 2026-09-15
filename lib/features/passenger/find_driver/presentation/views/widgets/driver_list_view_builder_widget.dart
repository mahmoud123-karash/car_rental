import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/driver_cubit/driver_cubit.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/driver_cubit/driver_states.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_list_view_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'message_builder_driver_widget.dart';

class DriverListViewBuilderWidget extends StatelessWidget {
  const DriverListViewBuilderWidget({
    super.key,
    required this.source,
    required this.destination,
  });
  final LatLng source, destination;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverCubit, DriversStates>(
      builder: (context, state) {
        if (state is SuccessGetDriversState) {
          if (state.list.isEmpty) {
            return MessageBuilderDriverWidget(
              message: S.of(context).no_available_drivers,
            );
          } else {
            return DriverListViewWidget(
              drivers: state.list,
              destination: destination,
              source: source,
            );
          }
        } else if (state is ErrorGetDriversState) {
          return MessageBuilderDriverWidget(
            message: state.error,
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: appSize(context).height / 2 - 200,
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: gryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
