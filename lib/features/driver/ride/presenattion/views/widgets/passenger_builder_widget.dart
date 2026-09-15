import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/passanger_cubit/passenger_cubit.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/passanger_cubit/passenger_states.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/widgets/passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengerBuilderWidget extends StatelessWidget {
  const PassengerBuilderWidget({
    super.key,
    required this.uid,
    required this.recieverUid,
  });
  final String uid, recieverUid;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassengerCubit, PassengerStates>(
      listener: (context, state) {
        if (state is ErrorGetPassengerState) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SucessGetPassengerState) {
          savePassengerName(state.model.name);
          savePasssengerPhone(state.model.phone);
          return PassengerWidget(
            name: state.model.name,
            phone: state.model.phone,
            uid: uid,
            recieverUid: recieverUid,
          );
        } else {
          String phone = CacheHelper.getData(key: 'phone') ?? 'Phone';
          String name = CacheHelper.getData(key: 'pName') ?? 'Name';

          return PassengerWidget(
            name: name,
            phone: phone,
            uid: uid,
            recieverUid: recieverUid,
          );
        }
      },
    );
  }
}
