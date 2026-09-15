import 'package:car_rental/features/driver/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:car_rental/features/driver/settings/presentation/views/settings_screen_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    SettingsCubit.get(context).getDriverData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: refreshController,
        onRefresh: () async {
          SettingsCubit.get(context).getDriverData();
          await Future.delayed(const Duration(seconds: 2));
          refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(const Duration(milliseconds: 1000));
          refreshController.loadComplete();
        },
        child: const SettingsScreenBuilderWidget(),
      ),
    );
  }
}
