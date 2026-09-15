import 'package:car_rental/features/passenger/history/data/models/history_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/shared/components.dart';
import '../../../../find_driver/data/models/ride_model/ride_model.dart';
import '../../../../ride/presentation/views/ride_screen.dart';
import 'statue_text_widget.dart';

class RowStatusAndFollowWidget extends StatelessWidget {
  const RowStatusAndFollowWidget({super.key, required this.model});
  final HistoryModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatusTextWidget(status: model.rideStatus),
        const Spacer(),
        if (model.rideStatus == 'Confirmed')
          TextButton(
            onPressed: () {
              if (model.rideStatus == 'Confirmed') {
                navigateTo(
                  context,
                  RideScreen(
                    ride: RideModel(
                      isArrived: model.isArrived,
                      rideUid: model.rideUid,
                      dAddress: model.dAddress,
                      sAddress: model.sAddress,
                      price: model.price,
                      isHere: model.isHere,
                      isPayed: model.isPayed,
                      rideStatus: model.rideStatus,
                      latS: model.latS,
                      latD: model.latD,
                      lngS: model.lngS,
                      lngD: model.lngD,
                      driverUid: model.driverUid,
                      passengerUid: model.passengerUid,
                      paymentMethod: model.paymentMethod,
                      time: model.time,
                    ),
                  ),
                );
              }
            },
            child: const Text('Follow'),
          ),
      ],
    );
  }
}
