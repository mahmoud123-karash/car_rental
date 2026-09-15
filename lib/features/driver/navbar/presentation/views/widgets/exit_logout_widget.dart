import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/exit_cubit/exit_cubit.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/exit_cubit/exit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExitLogoutWidget extends StatelessWidget {
  const ExitLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExitCubit, ExitStates>(
      builder: (context, state) {
        if (state is LoadingExitState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return AlertDialog(
            title: Text(
              'Exit',
              style: TextStyle(
                color: appColor,
              ),
            ),
            content: const Text(
              'Do you want to colse the app ?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  ExitCubit.get(context).updateAndExit(context);
                },
                child: const Text('Exit'),
              )
            ],
          );
        }
      },
    );
  }
}
