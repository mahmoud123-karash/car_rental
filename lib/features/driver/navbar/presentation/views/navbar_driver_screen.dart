// ignore_for_file: deprecated_member_use

import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/driver/navbar/domain/navbar_repo.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/exit_cubit/exit_cubit.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:car_rental/features/driver/navbar/presentation/views/widgets/bottom_nav_bar_widget.dart';
import 'package:car_rental/features/driver/navbar/presentation/views/widgets/exit_logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarDriverScreen extends StatefulWidget {
  const NavBarDriverScreen({super.key});

  @override
  State<NavBarDriverScreen> createState() => _NavBarDriverScreenState();
}

class _NavBarDriverScreenState extends State<NavBarDriverScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      returedOffline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          var cubit = NavBarCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              if (cubit.cIndex != 0) {
                cubit.changeIndex(0);
                return false;
              } else {
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider(
                    create: (context) => ExitCubit(
                      NavBarRepo(),
                    ),
                    child: const ExitLogoutWidget(),
                  ),
                );
                return false;
              }
            },
            child: Scaffold(
              bottomNavigationBar: BotttomNavBarWidget(
                cubit: cubit,
              ),
              body: cubit.screens[cubit.cIndex],
            ),
          );
        },
      ),
    );
  }
}
