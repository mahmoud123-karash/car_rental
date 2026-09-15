// ignore_for_file: deprecated_member_use

import 'package:car_rental/features/passenger/navbar/presentation/manager/navbar_cubit.dart';
import 'package:car_rental/features/passenger/navbar/presentation/manager/navbar_states.dart';
import 'package:car_rental/features/passenger/navbar/presentation/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

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
              }
              return true;
            },
            child: Scaffold(
              bottomNavigationBar: NavBarWidget(
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
