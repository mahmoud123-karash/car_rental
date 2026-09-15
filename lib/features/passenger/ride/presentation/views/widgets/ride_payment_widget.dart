import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/payment_name_and_change_text_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/ride_payment_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_image_container_widget.dart';

class RidePaymentWidget extends StatelessWidget {
  const RidePaymentWidget({
    super.key,
    required this.uid,
    required this.method,
    required this.isArrived,
  });
  final String uid, method;
  final bool isArrived;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentStates>(builder: (context, state) {
      String cachedMethod = CacheHelper.getData(key: 'method') ?? method;
      return GestureDetector(
        onTap: () {
          if (isArrived) {
          } else {
            showAppBottomSheet(
                context,
                RidePaymentSheetWidget(
                  uid: uid,
                  method: cachedMethod,
                ));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: gryColor.withOpacity(0.3),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                PaymentImageContainerWidget(image: getMethodImage(method)),
                PaymentNameAndChangeTestWidget(
                  method: cachedMethod,
                  isArrived: isArrived,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: gryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
