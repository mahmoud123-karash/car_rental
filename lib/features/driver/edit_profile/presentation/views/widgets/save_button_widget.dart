import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/update_cubit/update_cubit.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/update_cubit/update_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCubit, UpdateStates>(
      listener: (context, state) {
        if (state is SuccessUpdateState) {
          Navigator.pop(context);
          showToast('Profile updated');
        }
        if (state is ErrorUpdateState) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is LoadingUpdateState) {
          return const Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircularProgressIndicator(),
          );
        } else {
          return TextButton(
            onPressed: onPressed,
            child: Text(
              'save',
              style: TextStyle(
                color: whiteColor,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
