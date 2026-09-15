import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/navbar/presentation/views/navbar_screen.dart';
import 'package:car_rental/features/passenger/profile/presentation/manager/profile_cubit.dart';
import 'package:car_rental/features/passenger/profile/presentation/manager/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_button_widget.dart';

class MaterialButtonBuilderWidget extends StatelessWidget {
  const MaterialButtonBuilderWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is SucessUpdateProfileState) {
          showToast('updated');
          navigateToAndFinish(context, const NavBarScreen());
        }
        if (state is ErrroUpdateProfileState) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingUpdateProfileState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return MaterialButtonWidget(
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
