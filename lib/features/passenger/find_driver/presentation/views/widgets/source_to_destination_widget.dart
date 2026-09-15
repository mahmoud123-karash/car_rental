import 'package:flutter/material.dart';

import 'address_source_and_destination_row_widget.dart';
import 'stepper_source_destination_widget.dart';

class SourceToDestinationWidget extends StatelessWidget {
  const SourceToDestinationWidget(
      {super.key, required this.sAddress, required this.dAddress});
  final String sAddress, dAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 15,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressSourceAndDestinatiomRowWidget(
            address: sAddress,
            color: Colors.greenAccent,
          ),
          const StepperSourceDestinationWidget(),
          AddressSourceAndDestinatiomRowWidget(
            address: dAddress,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
