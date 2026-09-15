import 'package:car_rental/features/driver/home/presentation/views/home_screen.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:car_rental/features/driver/settings/presentation/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../history/presentation/views/history_screen.dart';
import '../../../../notification/presentation/views/driver_notification_screen.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitialNavBarState());
  static NavBarCubit get(context) => BlocProvider.of(context);

  int cIndex = 0;

  void changeIndex(int index) {
    cIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const DriverNotificationScreen(),
    const HistoryScreen(),
    const SettingsScreen(),
  ];
}
