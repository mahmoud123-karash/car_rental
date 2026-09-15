import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/settings/domain/repo/logout_repo.dart';
import 'package:car_rental/features/driver/settings/domain/use_cases/logout_use_case.dart';
import 'package:car_rental/features/driver/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:car_rental/features/driver/settings/presentation/manager/logout_cubit/logout_states.dart';
import 'package:car_rental/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutDiologWidget extends StatelessWidget {
  const LogoutDiologWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(
        LogoutUseCase(
          LogoutRepo(),
        ),
      ),
      child: AlertDialog(
        title: Text(
          S.of(context).logout,
          style: TextStyles.style20.copyWith(
            color: appColor,
          ),
        ),
        content: Text(
          S.of(context).are_you_sure,
          style: TextStyles.style20,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).no),
          ),
          BlocConsumer<LogoutCubit, LogoutStates>(
            listener: (context, state) {
              if (state is SuccessLogoutState) {
                navigateToAndFinish(context, const OnboradingScreen());
              }
              if (state is ErrorLogoutState) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is LoadingLogoutState) {
                return const CircularProgressIndicator();
              } else {
                return TextButton(
                  onPressed: () {
                    LogoutCubit.get(context).logout();
                  },
                  child: Text(S.of(context).logout),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
