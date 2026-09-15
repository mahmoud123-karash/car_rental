import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/home/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/all_requests_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'home_container_widget.dart';

class EarningAndBookingRowWidget extends StatefulWidget {
  const EarningAndBookingRowWidget({super.key, required this.model});
  final RideModel model;

  @override
  State<EarningAndBookingRowWidget> createState() =>
      _EarningAndBookingRowWidgetState();
}

class _EarningAndBookingRowWidgetState
    extends State<EarningAndBookingRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              navigateTo(
                context,
                AllRequestsScreen(
                  requests: widget.model.completedRides,
                  title: S.of(context).completed_rides,
                ),
              );
            },
            child: HomeContainerWidget(
              text: S.of(context).overall_earning,
              value: '${getEarings(widget.model.completedRides)}\$',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              navigateTo(
                context,
                AllRequestsScreen(
                  requests: widget.model.todayRides,
                  title: S.of(context).today_rides,
                ),
              );
            },
            child: HomeContainerWidget(
              text: S.of(context).today_requests,
              value: widget.model.todayRides.length.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
