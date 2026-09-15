import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_states.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/error_location_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/home_content_builder_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/loading_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationHomebuilderWidget extends StatelessWidget {
  const LocationHomebuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoctionCubit, LoactionStates>(
      builder: (context, state) {
        if (state is SucessGetLocationState) {
          bool mission = CacheHelper.getData(key: 'mission') ?? false;

          if (!mission) {
            return const HomeContentBuilderWidget();
          } else {
            return const MaterialButtonWidget(
              text: 'Start',
            );
          }
        } else if (state is ErrorGetLoactionState) {
          return ErrorLoactionWidget(message: state.message);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
