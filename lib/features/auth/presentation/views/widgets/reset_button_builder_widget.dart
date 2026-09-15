import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/manager/reset_cubit/reset_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/reset_cubit/reset_states.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_widget.dart';

class ResetButtonBuilderWidget extends StatelessWidget {
  const ResetButtonBuilderWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetStates>(
      listener: (context, state) {
        if (state is ErrorResetState) {
          showSnackBar(context, state.error);
        }
        if (state is SuccessResetState) {
          Navigator.pop(context);
          showSnackBar(context, S.of(context).check_your_email);
        }
      },
      builder: (context, state) {
        if (state is LoadingResetState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ButtonWidget(
            text: S.of(context).send_email,
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
