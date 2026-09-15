import 'package:car_rental/features/driver/home/presentation/views/widgets/location_home_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/home/presentation/manager/complete_cubit/complete_cubit.dart';
import 'package:car_rental/features/driver/home/presentation/manager/complete_cubit/compplete_states.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/error_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_button_widget.dart';

class StartConsumerBuilderWidget extends StatelessWidget {
  const StartConsumerBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteCubit, CompleteStates>(
      listener: (context, state) {
        if (state is SuccessGetDataState) {
          if (state.model.carComplete && state.model.profileComplete) {
            saveOnline(true);
            showSnackBar(context, 'Online');
          } else {
            showSnackBar(context, 'Please complete your profile first');
          }
        }
      },
      builder: (context, state) {
        bool isOnline = CacheHelper.getData(key: 'online') ?? false;
        if (isOnline) {
          if (state is SuccessGetDataState) {
            if (state.model.carComplete && state.model.profileComplete) {
              return const LocationHomebuilderWidget();
            } else {
              return const MaterialButtonWidget(
                text: 'Start',
              );
            }
          } else if (state is ErrorGetDataState) {
            return StartErrorWidget(
              message: state.message,
            );
          } else if (state is LoadingGetDataState) {
            return const LoadingWidget();
          } else {
            return const MaterialButtonWidget(
              text: 'Start',
            );
          }
        } else {
          return const MaterialButtonWidget(
            text: 'Start',
          );
        }
      },
    );
  }
}
