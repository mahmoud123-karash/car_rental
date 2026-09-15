// ignore_for_file: file_names

import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/button_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButtonBuilderWidget extends StatelessWidget {
  const RegisterButtonBuilderWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is ErrorRegistertate) {
          showSnackBar(context, state.error);
        }
        if (state is SuccessRegistertate) {
          showToast(S.of(context).register_success);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingRegistertate) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: ButtonWidget(
              text: S.of(context).sign_up_btn,
              onPressed: onPressed,
            ),
          );
        }
      },
    );
  }
}
