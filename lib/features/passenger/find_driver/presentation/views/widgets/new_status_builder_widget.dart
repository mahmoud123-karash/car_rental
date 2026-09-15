import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/text_message_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class NewStatusBuilderWidget extends StatelessWidget {
  const NewStatusBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextMessageWidget(
          message: S.of(context).wait_for_driver_accept,
        ),
        CircularProgressIndicator(
          color: gryColor.withOpacity(0.5),
        )
      ],
    );
  }
}
