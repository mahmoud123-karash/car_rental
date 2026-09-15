import 'package:car_rental/features/driver/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:car_rental/features/driver/settings/presentation/manager/settings_cubit/settings_states.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/settings_error_builder_widget.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/settings_loading_builder_widget.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/settings_sucess_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreenBuilderWidget extends StatelessWidget {
  const SettingsScreenBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        if (state is SuccessGetProfileDataState) {
          return SettingsSuccessBuilderWidget(
            driver: state.driver,
          );
        } else if (state is ErrorGetProfileDataState) {
          return SettingsErrorBuilderWidget(
            message: state.message,
          );
        } else {
          return const SettingsLoadingBuilderWidget();
        }
      },
    );
  }
}
