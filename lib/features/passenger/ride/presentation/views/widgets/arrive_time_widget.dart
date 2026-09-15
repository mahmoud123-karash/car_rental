import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class ArriveTimeWidget extends StatelessWidget {
  const ArriveTimeWidget(
      {super.key, required this.time, required this.isArrived});
  final String time;
  final bool isArrived;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      child: Row(
        children: [
          Icon(
            isArrived ? Icons.flag : Icons.timelapse_sharp,
            color: whiteColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            isArrived
                ? S.of(context).driver_is_here
                : S.of(context).driver_will_arrive_in,
            style: TextStyles.style15.copyWith(
              color: whiteColor,
              fontFamily: '',
            ),
          ),
          const Spacer(),
          if (!isArrived)
            Container(
              decoration: BoxDecoration(
                color: gryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: whiteColor,
                    fontFamily: '',
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
