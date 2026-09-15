import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/manage_cubit.dart/manage_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/manage_cubit.dart/manage_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/rating_screen.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/container_info_ride_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ContainerInfoRideBuilderWidget extends StatefulWidget {
  const ContainerInfoRideBuilderWidget({super.key, required this.ride});
  final RideModel ride;

  @override
  State<ContainerInfoRideBuilderWidget> createState() =>
      _ContainerInfoRideBuilderWidgetState();
}

class _ContainerInfoRideBuilderWidgetState
    extends State<ContainerInfoRideBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageCubit, ManageStates>(
      listener: (context, state) {
        if (state is ErrorManageState) {
          showSnackBar(context, state.message);
        }
        if (state is SuccessManageState) {
          if (state.model.rideStatus == 'Completed') {
            String name = CacheHelper.getData(key: 'dName') ?? 'Driver Name';
            String image = CacheHelper.getData(key: 'dImage') ?? '';
            Future.delayed(const Duration(seconds: 5)).then(
              (value) {
                if (mounted && context.mounted) {
                  navigateToAndFinish(
                    context,
                    RatingScreen(
                      image: image,
                      name: name,
                      driverUid: widget.ride.driverUid,
                      rideUid: widget.ride.rideUid,
                      date: DateFormat.yMMMEd().format(
                        widget.ride.time.toDate(),
                      ),
                      destination: widget.ride.dAddress,
                      source: widget.ride.sAddress,
                      method: widget.ride.paymentMethod,
                      price: widget.ride.price,
                    ),
                  );
                }
              },
            );
          } else {
            Future.delayed(const Duration(seconds: 30)).then(
              (value) {
                if (mounted && context.mounted) {
                  ManageCubit.get(context).getData(uid: widget.ride.rideUid);
                }
              },
            );
          }
        }
      },
      builder: (context, state) {
        if (state is SuccessManageState) {
          return ContainerInfoRideWidget(
            ride: widget.ride,
            model: state.model,
          );
        } else {
          return ContainerInfoRideWidget(
            ride: widget.ride,
            model: ManageModel(
              rideStatus: 'Confirmed',
              isArrived: false,
            ),
          );
        }
      },
    );
  }
}
