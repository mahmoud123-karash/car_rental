import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/home/presentation/manager/request_cubit/request_cubit.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class CancelAndAcceptRowWidget extends StatelessWidget {
  const CancelAndAcceptRowWidget(
      {super.key, required this.uid, required this.driverUid});
  final String uid;
  final String driverUid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtonWidget(
          onPressed: () {
            RequestCubit.get(context).cancelRequest(uid: uid);
          },
          color: const Color(0xFFFF0B0B),
          lable: S.of(context).cancel,
        ),
        const SizedBox(
          width: 20,
        ),
        CustomButtonWidget(
          onPressed: () {
            RequestCubit.get(context)
                .confirmRequest(uid: uid, driverUid: driverUid);
          },
          color: appColor,
          lable: S.of(context).accept,
        )
      ],
    );
  }
}
