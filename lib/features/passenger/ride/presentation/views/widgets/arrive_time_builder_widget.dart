import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/time_cubit/time_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/time_cubit/time_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/arrive_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'message_widget_builder.dart';

class ArriveTimeBuilderWidget extends StatefulWidget {
  const ArriveTimeBuilderWidget({
    super.key,
    required this.uid,
    required this.source,
    required this.isArrived,
  });
  final String uid;
  final LatLng source;
  final bool isArrived;

  @override
  State<ArriveTimeBuilderWidget> createState() =>
      _ArriveTimeBuilderWidgetState();
}

class _ArriveTimeBuilderWidgetState extends State<ArriveTimeBuilderWidget> {
  @override
  void initState() {
    CacheHelper.removeData(key: 'time');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeCubit, TimeStates>(
      listener: (context, state) {
        if (state is SuceesGetTimeState) {
          if (!widget.isArrived) {
            Future.delayed(
              const Duration(seconds: 30),
            ).then((value) {
              if (mounted && context.mounted) {
                TimeCubit.get(context).getTime(
                  uid: widget.uid,
                  source: widget.source,
                );
              }
            });
          }
        }
      },
      builder: (context, state) {
        if (state is SuceesGetTimeState) {
          saveTime(state.time.time);
          return ArriveTimeWidget(
            time: state.time.time,
            isArrived: widget.isArrived,
          );
        } else if (state is ErrorGetTimeState) {
          return MessageBuilderWidget(
            message: state.message,
            color: whiteColor,
          );
        } else {
          String time = CacheHelper.getData(key: 'time') ?? '';
          return ArriveTimeWidget(
            time: time,
            isArrived: widget.isArrived,
          );
        }
      },
    );
  }
}
