import 'package:car_rental/features/passenger/settings/presentation/manager/passenger_cubit.dart';
import 'package:car_rental/features/passenger/settings/presentation/manager/passenger_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_builder_widget.dart';
import 'loading_builder_widget.dart';
import 'success_builder_widget.dart';

class SettingsBuilderWidget extends StatelessWidget {
  const SettingsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengerCubit, PassengerStates>(
      builder: (context, state) {
        if (state is SuccessGetPassengerDataState) {
          return SuccessBuilderWidget(
            passenger: state.passenger,
          );
        } else if (state is ErrorGetPassengerDataState) {
          return ErrorBuilderWidget(error: state.error);
        } else {
          return const LoadingBuilderWidget();
        }
      },
    );
  }
}
