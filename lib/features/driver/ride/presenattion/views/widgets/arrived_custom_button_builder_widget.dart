import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/arrived_cubit/arrived_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/arrived_cubit/arrived_states.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/custom_button_builder_widget.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/custom_button_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrivedCustomButtonBuilderWidget extends StatelessWidget {
  const ArrivedCustomButtonBuilderWidget({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArrivedCubit, ArrivedStates>(
      builder: (context, state) {
        String isArrived = CacheHelper.getData(key: 'dStatus') ?? '';
        if (isArrived != '') {
          return CustomButtonBuilderWidget(
            uid: uid,
          );
        } else {
          return CustomButtonWidget(
            lable: S.of(context).arrived,
            onpressed: () {
              saveDriverStatus('Start Trip');
              ArrivedCubit.get(context).updateRide(uid: uid);
            },
          );
        }
      },
    );
  }
}
