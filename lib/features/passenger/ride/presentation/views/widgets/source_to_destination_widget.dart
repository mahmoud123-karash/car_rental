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
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressSourceAndDestinatiomRowWidget(
            text: 'Start Location',
            address: sAddress,
            color: Colors.greenAccent,
          ),
          const StepperSourceDestinationWidget(),
          AddressSourceAndDestinatiomRowWidget(
            text: 'Your Destination',
            address: dAddress,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
