import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/features/driver/navbar/presentation/views/navbar_driver_screen.dart';
import 'package:car_rental/features/driver/ride/data/data_sources/remote_data_source/ride_remote_data_source.dart';
import 'package:car_rental/features/driver/ride/data/repo/ride_repo_impl.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/ride_cubit/ride_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/ride_cubit/ride_states.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/custom_button_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBuilderWidget extends StatefulWidget {
  const CustomButtonBuilderWidget({
    super.key,
    required this.uid,
  });
  final String uid;

  @override
  State<CustomButtonBuilderWidget> createState() =>
      _CustomButtonBuilderWidgetState();
}

class _CustomButtonBuilderWidgetState extends State<CustomButtonBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RideCubit(
        RideRepoImpl(
          RideRemoteDataSourceImpl(),
        ),
      )..getRide(uid: widget.uid),
      child: BlocConsumer<RideCubit, RideStates>(
        listener: (context, state) {
          if (state is ErrorGetRideState) {
            showSnackBar(context, state.message);
          }
          if (state is SucessGetRideState) {
            if (!state.model.isPayed) {
              Future.delayed(
                const Duration(seconds: 30),
              ).then((value) {
                if (mounted && context.mounted) {
                  RideCubit.get(context).getRide(uid: widget.uid);
                }
              });
            }
          }
        },
        builder: (context, state) {
          String paymentStatus = CacheHelper.getData(key: 'dStatus') ?? '';
          String getLocalizedStatus(String status) {
            if (status == 'Start Trip') return S.of(context).start_trip;
            if (status == 'End Trip') return S.of(context).end_trip;
            return status;
          }

          if (state is SucessGetRideState) {
            if (state.model.paymentMethod == 'Cash') {
              return CustomButtonWidget(
                lable: getLocalizedStatus(paymentStatus),
                onpressed: () {
                  if (paymentStatus == 'Start Trip') {
                    saveDriverStatus('End Trip');
                    setState(() {});
                  } else {
                    RideCubit.get(context).completeRide(uid: widget.uid);
                    navigateToAndFinish(context, const NavBarDriverScreen());
                    CacheHelper.removeData(key: 'dStatus');
                    CacheHelper.removeData(key: 'mission');
                  }
                },
              );
            } else {
              if (state.model.isPayed) {
                return CustomButtonWidget(
                  lable: getLocalizedStatus(paymentStatus),
                  onpressed: () {
                    if (paymentStatus == 'Start Trip') {
                      saveDriverStatus('End Trip');
                      setState(() {});
                    } else {
                      RideCubit.get(context).completeRide(uid: widget.uid);
                      navigateToAndFinish(context, const NavBarDriverScreen());
                      CacheHelper.removeData(key: 'dStatus');
                      CacheHelper.removeData(key: 'mission');
                    }
                  },
                );
              } else {
                return Center(
                  child: Text(
                    S.of(context).passenger_must_pay,
                    style: TextStyles.style16,
                  ),
                );
              }
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
