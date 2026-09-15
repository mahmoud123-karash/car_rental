import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/features/driver/history/data/models/history_model.dart';
import 'package:car_rental/features/driver/history/presentation/views/widgets/status_text_widget.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/ride/presenattion/views/ride_screen.dart';
import 'package:flutter/material.dart';

class StatusAndFollowRowWidget extends StatelessWidget {
  const StatusAndFollowRowWidget({super.key, required this.model});
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
              navigateTo(
                context,
                RideScreen(
                  model: RequestModel(
                    rideUid: model.rideUid,
                    dAddress: model.dAddress,
                    sAddress: model.sAddress,
                    price: model.price,
                    isHere: model.isHere,
                    isPayed: model.isPayed,
                    isArrived: model.isArrived,
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
            },
            child: const Text(
              'Follow',
              style: TextStyles.style15,
            ),
          )
      ],
    );
  }
}
