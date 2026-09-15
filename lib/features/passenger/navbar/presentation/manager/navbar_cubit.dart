import 'package:car_rental/features/passenger/favorite/presentation/views/favorite_screen.dart';
import 'package:car_rental/features/passenger/history/presentation/views/history_screen.dart';
import 'package:car_rental/features/passenger/home/presentation/views/home_screen.dart';
import 'package:car_rental/features/passenger/navbar/presentation/manager/navbar_states.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    const FavoriteScreen(),
    const HistoryScreen(),
    const SettingsScreen(),
  ];
}
