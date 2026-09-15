import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:car_rental/features/driver/navbar/presentation/views/navbar_driver_screen.dart';
import 'package:car_rental/features/passenger/navbar/presentation/views/navbar_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_widget.dart';

class LoginButtonBuilderWidget extends StatelessWidget {
  const LoginButtonBuilderWidget({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is ErrorLoginState) {
          showSnackBar(context, state.error);
        }
        if (state is SuccessLoginState) {
          showToast(S.of(context).login_success);
          String userType = CacheHelper.getData(key: 'usertype');
          if (userType == 'driver') {
            navigateToAndFinish(context, const NavBarDriverScreen());
          } else {
            navigateToAndFinish(context, const NavBarScreen());
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingLoginState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ButtonWidget(
            text: S.of(context).login_btn,
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
