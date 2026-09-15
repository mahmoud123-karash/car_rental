import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/address_row_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/method_and_money_row_widget.dart';
import 'package:flutter/material.dart';
import 'cancel_and_accept_row_widget.dart';
import 'stepper_source_destination_widget.dart';

class RequestItemWidget extends StatelessWidget {
  const RequestItemWidget({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFCFCFCF),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MethodAndMoneyRowWidget(
                method: request.paymentMethod, price: request.price),
            const SizedBox(
              height: 40,
            ),
            AddressRowWidget(
              address: request.sAddress,
              color: Colors.greenAccent,
            ),
            const StepperSourceDestinationWidget(),
            AddressRowWidget(
              address: request.dAddress,
              color: Colors.red,
            ),
            const SizedBox(
              height: 40,
            ),
            CancelAndAcceptRowWidget(
              uid: request.rideUid,
              driverUid: request.driverUid,
            ),
          ],
        ),
      ),
    );
  }
}
