import 'package:car_rental/features/passenger/settings/data/data_sources/local_data_source/settings_local_data_source.dart';
import 'package:car_rental/features/passenger/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import 'package:car_rental/features/passenger/settings/data/repo/settings_repo_impl.dart';
import 'package:car_rental/features/passenger/settings/presentation/manager/passenger_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/settings_builder_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(
        SettingsRepoImpl(
          SettingsRemoteDataSourceIMpl(),
          SettingsLocalDataSourceImpl(),
        ),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const SettingsBuilderWidget(),
      ),
    );
  }
}
